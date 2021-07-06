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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
public class MemberController {
	private final UserService userServiceImpl;
	private final StoreService storeServiceImpl;
	
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
				userServiceImpl.imageEnroll(image);
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

	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public ResponseEntity<List<ImageVO>> uploadAjaxAction(MultipartFile[] uploadFile) {
		System.out.println("uploadAjaxAction");
		String uploadFolder = "C:\\Users\\subin\\Desktop\\upload";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		System.out.println("str:" + str);

		String datePath = str.replace("-", File.separator);
		System.out.println("datePath:" + datePath);

		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {

			uploadPath.mkdirs();
		}

		List<ImageVO> list = new ArrayList();


		for (MultipartFile multipartFile : uploadFile) {
			System.out.println("파일 이름 : " + multipartFile.getOriginalFilename());

			File checkfile=new File(multipartFile.getOriginalFilename());
			String type=null;

			try {
				type = Files.probeContentType(checkfile.toPath());
				System.out.println("mimetype:"+type);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			if(!type.startsWith("image")) {
				list=null;
				return new ResponseEntity<>(list,HttpStatus.BAD_REQUEST);
			}



			ImageVO vo =new ImageVO();
			vo.setUploadPath(datePath);

			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);

			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName;

			File saveFile = new File(uploadPath, uploadFileName);

			try {
				multipartFile.transferTo(saveFile);

				File thumbnailFile=new File(uploadPath,"s_"+uploadFileName);

				BufferedImage bo_image=ImageIO.read(saveFile);

				double ratio=3;
				int width = (int) (bo_image.getWidth() / ratio); 
				int height = (int) (bo_image.getHeight() / ratio);

				BufferedImage bt_image=new
						BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);

				Graphics2D graphic = bt_image.createGraphics();

				graphic.drawImage(bo_image,0, 0,width,height, null);

				ImageIO.write(bt_image,"jpg",thumbnailFile);



			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			list.add(vo);
		} //for문


		System.out.println(list);

		ResponseEntity<List<ImageVO>> result = new ResponseEntity<List<ImageVO>>(list, HttpStatus.OK);

		return result;

	}// "/uploadAjaxAction"


	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getImage(String fileName){

		System.out.println("파일 이름 : " + fileName);

		File file =new File("C:\\Users\\subin\\Desktop\\upload\\"+ fileName);


		ResponseEntity<byte[]> result = null;

		try {

			org.springframework.http.HttpHeaders header = new org.springframework.http.HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		}catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println(result);
		return result;
	}


	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		System.out.println("deleteFile");


		File file=null;

		try {

			file= new File("C:\\Users\\subin\\Desktop\\upload\\"+ URLDecoder.decode(fileName,"UTF-8"));
			System.out.println(file);
			file.delete();

			String originFileName=file.getAbsolutePath().replace("s_","");
			System.out.println("originFileName :"+originFileName);
			file =new File(originFileName);
			file.delete();

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail",HttpStatus.NOT_IMPLEMENTED);

		}

		return new ResponseEntity<String>("success",HttpStatus.OK);

	}

}
