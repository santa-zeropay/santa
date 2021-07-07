package com.spring.web.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spring.web.service.ImageService;
import com.spring.web.service.StoreService;
import com.spring.web.service.UserService;
import com.spring.web.vo.ImageVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/user")
@RequiredArgsConstructor
public class UserController {
	private final UserService userServiceImpl;
	private final StoreService storeServiceImpl;
	private final ImageService imageServiceImpl;

	@GetMapping("/register")
	public void joinGET() {
		log.info("회원가입 페이지 집입");
	}

	public Map<String, String> validateHandling(Errors errors) {
		Map<String, String> validatorResult = new HashMap<>();

		for (FieldError error : errors.getFieldErrors()) {
			String validKeyName = String.format("valid_%s", error.getField());
			validatorResult.put(validKeyName, error.getDefaultMessage());
		}
		return validatorResult;
	}


	@PostMapping("/register")
	public String userJoin(@Valid UserVO vo,StoreVO svo,Errors errors, Model model) {
		log.info("join 진입");

		if (errors.hasErrors()) {
			// 회원가입 실패시, 입력 데이터를 유지
			model.addAttribute("vo", vo);

			// 유효성 통과 못한 필드와 메시지를 핸들링
			Map<String, String> validatorResult = userServiceImpl.validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			return "/user/register";
		}
		userServiceImpl.userJoin(vo);		

		log.info("join 성공");

		if(vo.getRole()==1) {
			UserVO uservo=userServiceImpl.getUser(vo);
			svo.setUser_id(uservo.getId());
			storeServiceImpl.storeJoin(svo);
			log.info("join 성공");

			for (ImageVO image:svo.getImageList()) {
				image.setStore_id(svo.getId());
				imageServiceImpl.StoreImageEnroll(image);
			}	
		}
		//4. 로그인페이지로 이동(주소줄과 view페이지 동시에 insert->login 변경되어야함)
		return "redirect:/user/loginPage";
	}

	@GetMapping("/loginPage")
	public String loginPage() {
		log.info("로그인 페이지 진입");
		return "user/loginPage";
	}

	@PostMapping("/login")
	public String login(UserVO vo,HttpSession httpSession) {
		UserVO user=userServiceImpl.getUser(vo);
		int uid = user.getId();
		StoreVO storevo =storeServiceImpl.getStoreByUserId(uid);
		int store_id=storevo.getId();

		if(user!=null) {
			httpSession.setAttribute("id", user.getId());
			httpSession.setAttribute("email", user.getEmail());
			httpSession.setAttribute("password", user.getPassword());
			httpSession.setAttribute("store_id", store_id);

			log.info(""+store_id);
			return "/main";
		}
		return "/user/loginPage";
	}

	@GetMapping("/myPage")
	public void myPage(HttpSession httpSession,Model model) {
		int id = (int) httpSession.getAttribute("id");
		log.info(" 회원정보보기 GET의 아이디 "+id);

		//서비스안의 회원정보보기 메서드 호출
		UserVO user = userServiceImpl.getUserById(id);
		log.info(""+user);
		model.addAttribute("user", user);
	}
	//고객 정보 수정 화면 요청
	@GetMapping("/myPageModify")
	public String modify(int id, Model model) {
		//선택한 고객의 정보를 DB에서 조회해온 후
		//수정 화면에 출력할 수 있도록 Model에 담는다
		model.addAttribute("user", userServiceImpl.getUserById(id));
		return "user/myPageModify";
	}
	//고객 정보 수정 저장 처리 요청
	@PostMapping("/myPageUpdate")
	public String update(UserVO vo) {
		log.info(""+vo);
		//화면에서 수정 입력한 정보를 DB에 저장한 후
		userServiceImpl.userUpdate(vo);
		log.info("수정완료");
		//화면으로 연결
		return "redirect:/user/myPage";

	}


}
