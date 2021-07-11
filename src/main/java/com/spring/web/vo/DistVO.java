package com.spring.web.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class DistVO {
	private int id;
	private int store_id;
	private String name;	//비교당하는가게
	private double distance;	//두가게의 거리
	
}
