package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.District;
import egovframework.example.sample.service.DistrictService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class DistrictServiceImpl extends EgovAbstractServiceImpl implements DistrictService {
	
	private final DistrictMapper   districtDao; 
	private final EgovIdGnrService egovIdGnrService;
	
	// 행정구역 리스트를 가져오는 메소드 by 나희
	@Override
	public List<District> districtList() {
		log.info("districtList Start...");
		List<District> districtList = districtDao.searchDistrict();
		log.info("districtList End...");
		return districtList;
	}

}
