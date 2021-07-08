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
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.web.service.ImageService;
import com.spring.web.service.ImageServiceImpl;
import com.spring.web.vo.ImageVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/user")

public class ImageController {

	private final ImageService imageServiceImpl;

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

	/* 이미지 정보 반환 */
	@RequestMapping(value="/getImageList")
	@ResponseBody
	public ResponseEntity<List<ImageVO>> getImageList(int id){
		System.out.println("getImageList"+id);
		System.out.println(imageServiceImpl.getImageList(id));
		return new ResponseEntity<List<ImageVO>>(imageServiceImpl.getImageList(id), HttpStatus.OK);

	}
}
