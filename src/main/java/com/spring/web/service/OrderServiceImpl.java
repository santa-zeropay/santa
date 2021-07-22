package com.spring.web.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.web.dto.MenuCartDto;
import com.spring.web.mapper.CartMapper;
import com.spring.web.mapper.DistMapper;
import com.spring.web.mapper.OrderMapper;
import com.spring.web.vo.CartVO;
import com.spring.web.vo.OrderDetailVO;
import com.spring.web.vo.OrderVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

	private final OrderMapper orderMapper;

	@Override
	public void orderInfo(OrderVO vo) {
		orderMapper.orderInfo(vo);
		
	}

	@Override
	public void orderInfo_Details(OrderDetailVO vo) {
		orderMapper.orderInfo_Details(vo);
	}

	@Override
	public OrderVO getOrderId(int id){
		return orderMapper.getOrderId(id);
	}

	@Override
	public List<OrderVO> getOrderListByUserId(int id) {
		return orderMapper.getOrderListByUserId(id);
	}

	@Override
	public List<OrderDetailVO> getOrderDetail(int id) {
		return orderMapper.getOrderDetail(id);
	}

}