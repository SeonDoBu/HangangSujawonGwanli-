package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.service.GigwanService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class GigwanServiceImpl extends EgovAbstractServiceImpl implements GigwanService {
	
	private final GigwanMapper gigwanMapper;
	private final EgovIdGnrService egovIdGnrService;
	
	@Override
	public List<Gigwan> gigwanList() {
		log.info("gigwanList Start...");
		List<Gigwan> gigwanList = null;
		try {
			gigwanList = gigwanMapper.gigwanList();
		} catch (Exception e) {
			log.info("gigwanList " + e.getMessage());
		} finally {
			log.info("gigwanList End...");
		}
		return gigwanList;
	}

}
