package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.service.CommoncodeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class CommoncodeServiceImpl extends EgovAbstractServiceImpl implements CommoncodeService {
	
	private final CommoncodeMapper commoncodeDao;
	private final EgovIdGnrService egovIdGnrService;
	
	// 조건에 맞는 공통코드 리스트를 가져오는 메소드 by 나희
	@Override
	public List<Commoncode> commoncodeList(Commoncode cc) {
		log.info("commoncodeList Start...");
		List<Commoncode> commoncodeList = commoncodeDao.searchList(cc);
		log.info("commoncodeList End...");
		return commoncodeList;
	}

}
