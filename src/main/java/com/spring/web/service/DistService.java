package com.spring.web.service;

import java.util.List;

import com.spring.web.vo.DistVO;

public interface DistService {

	public double distance(double lat1, double lon1, double lat2, double lon2);

	public List<DistVO> getDist3();

	public void distJoin(DistVO vo);

	public void truncateDist();
}
