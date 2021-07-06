package com.spring.web.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ImageVO {

	 private int store_id;
	 
	 private String uuid;
	 private String fileName;
	 private String uploadPath;
}