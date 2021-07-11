package com.spring.web.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.web.dto.DistAndImageDto;
import com.spring.web.mapper.DistMapper;
import com.spring.web.mapper.ImageMapper;
import com.spring.web.vo.DistVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class DistServiceImpl implements DistService{
	
	private final DistMapper distMapper;
	
	@Override
	public double distance(double lat1, double lon1, double lat2, double lon2) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(lat1 * Math.PI / 180.0) * Math.sin(lat2 * Math.PI / 180.0) + Math.cos(lat1 * Math.PI / 180.0) * Math.cos(lat2 * Math.PI / 180.0) * Math.cos(theta * Math.PI / 180.0);
         
        dist = Math.acos(dist);
        dist = dist * 180 / Math.PI;
        dist = dist * 60 * 1.1515 *1609.344;
 
        return dist;
      
    }

	@Override
	public List<DistVO> getDist3() {
		return distMapper.getDist3();
	}

	@Override
	public void distJoin(DistVO vo) {
		distMapper.distJoin(vo);
	}

	@Override
	public void truncateDist() {
		distMapper.truncateDist();
		
	}

	@Override
	public List<DistAndImageDto> distWithImage() {
		
		return distMapper.DistWithImage();
	}
}
