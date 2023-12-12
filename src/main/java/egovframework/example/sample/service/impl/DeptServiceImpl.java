package egovframework.example.sample.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.Dept;
import egovframework.example.sample.service.DeptService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeptServiceImpl extends EgovAbstractServiceImpl implements DeptService {
	private static final Logger LOGGER = LoggerFactory.getLogger(DeptServiceImpl.class);
	

	private final DeptMapper deptDAO;
	
	/** ID Generation */
	private final EgovIdGnrService egovIdGnrService;
	
	@Override
	public Dept findOnd(int id) {
		System.out.println("findUser 서비스 시작!!");
		Dept findUser = deptDAO.findOnd(id);
		System.out.println("findUser 서비스 끝!!");		
		return findUser;
	}
	
	@Override
	public int count() {
		System.out.println("deptService 서비스 시작!!");
		int countTotal = deptDAO.selectDept();
		System.out.println("deptService 서비스 끝!!");		
		return countTotal;
	}
	

}
