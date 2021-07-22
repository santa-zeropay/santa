package com.spring.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.dto.MenuCartDto;
import com.spring.web.vo.CartVO;
import com.spring.web.vo.OrderDetailVO;
import com.spring.web.vo.OrderVO;

@Mapper
public interface OrderMapper {
	public void orderInfo(OrderVO vo);
	public void orderInfo_Details(OrderDetailVO vo);
	public OrderVO getOrderId(int id);	
	public List<OrderVO> getOrderListByUserId(int id);	
	public List<OrderDetailVO> getOrderDetail(int id);
}