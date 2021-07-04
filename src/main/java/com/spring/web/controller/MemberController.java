package com.spring.web.controller;



import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.web.service.UserService;
import com.spring.web.vo.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/user")
@RequiredArgsConstructor
public class MemberController {
	private final UserService userServiceImpl;

	@GetMapping("/register")
	public void joinGET() {
		log.info("회원가입 페이지 집입");
	}

	@PostMapping("/register")
	public String userJoin(UserVO vo) {
		log.info("join 진입");

		userServiceImpl.userJoin(vo);		

		log.info("join 성공");

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

		if(user!=null) {
			httpSession.setAttribute("id", user.getId());
			httpSession.setAttribute("email", user.getEmail());
			httpSession.setAttribute("password", user.getPassword());

			return "/main";
		}
		return "/user/loginPage";
	}

	@GetMapping("/cart")
	public void cart() {

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
