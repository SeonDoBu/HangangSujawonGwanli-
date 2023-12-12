package egovframework.example.sample.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.TestService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TestServiceImpl extends EgovAbstractServiceImpl implements TestService {
	
	private final TestMapper tm;

	private final EgovIdGnrService egovIdGnrService;
	
	@Override
	public int testcount() {
		
		int testcount = tm.testcount();
		
		return testcount;
	}

	
	
}
