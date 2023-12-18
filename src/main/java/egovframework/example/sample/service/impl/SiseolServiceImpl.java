package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Inspection;
import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.dto.Users;
import egovframework.example.sample.service.SiseolService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class SiseolServiceImpl extends EgovAbstractServiceImpl implements SiseolService {
	private final SiseolMapper siseolMapper;

	@Override
	public int count(Siseol siseol) {
		System.out.println("SiseolService count Start...");
		int result = 0;
		try {
			result = siseolMapper.siseolCount(siseol);
			System.out.println("SiseolService count End...");
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl count Exception -> " + e.getMessage());
		}
		return result;
	}

	@Override
	public List<Siseol> siseolList(Siseol siseol) {
		System.out.println("SiseolServiceImpl siseolList start...");
		List<Siseol> list = null;
		try {
			list = siseolMapper.siseolList(siseol);
			System.out.println("SiseolService siseolList list---> " + list);
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl siseolList Exception -> " + e.getMessage());
		}
		return list;
	}

	@Override
	public List<Commoncode> commonList() {
		System.out.println("SiseolServiceImpl siseolList start...");
		List<Commoncode> list = null;
		try {
			list = siseolMapper.commonList();
			System.out.println("SiseolService commonlList list---> " + list);
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl commonList Exception -> " + e.getMessage());
		}
		return list;
	}

	@Override
	public List<District> districtList() {
		System.out.println("SiseolServiceImpl siseolList start...");
		List<District> list = null;
		try {
			list = siseolMapper.districtList();
			System.out.println("SiseolService districtList list---> " + list);
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl districtList Exception -> " + e.getMessage());
		}
		return list;
	}

	@Override
	public List<Gigwan> gigwanList() {
		System.out.println("SiseolServiceImpl siseolList start...");
		List<Gigwan> list = null;
		try {
			list = siseolMapper.gigwanList();
			System.out.println("SiseolService gigwanList list---> " + list);
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl gigwanList Exception -> " + e.getMessage());
		}
		return list;
	}

	@Override
	public int selectedCount(Siseol siseol) {
		System.out.println("SiseolService selectedCount Start...");
		int result = 0;
		try {
			result = siseolMapper.selectedSiseolCount(siseol);
			System.out.println("SiseolService selectedCount End...");
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl count Exception -> " + e.getMessage());
		}
		return result;
	}

	@Override
	public List<Siseol> selectedSiseolList(Siseol siseol) {
		System.out.println("SiseolServiceImpl selectedSiseolList start...");
		List<Siseol> list = null;
		try {
			list = siseolMapper.selectedSiseolList(siseol);
			System.out.println("SiseolService selectedSiseolList list---> " + list);
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl selectedSiseolList Exception -> " + e.getMessage());
		}
		return list;
	}

	// siseolId에 해당하는 시설물 정보를 가져오는 메소드 by 나희
	@Override
	public Siseol siseolDetail(int siseolId) {
		log.info("siseolDetail Start...");
		Siseol siseol = new Siseol();
		try {
			siseol = siseolMapper.siseolDetail(siseolId);
			// log.info("siseolDetail => " + siseol.getSiseolName();
		} catch (Exception e) {
			log.info("siseolDetail " + e.getMessage());
		} finally {
			log.info("siseolDetail End...");
		}
		return siseol;
	}

	@Override
	public int inspectionInsert(Inspection inspection) {
		System.out.println("SiseolServiceImpl inspectionInsert start...");
		int result = 0;
		try { 
			System.out.println("SiseolServiceImpl inspection.getUser_id()-->  " + inspection);
			result = siseolMapper.inspectionInsert(inspection);
			System.out.println("SiseolService inspectionInsert result---> " + result);
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl inspectionInsert Exception -> " + e.getMessage());
		}
		return result;
	}


	// 입력한 수자원정보를 insert하는 메소드 by 나희
	@Override
	public int siseolInsert(Siseol siseol) {
		log.info("siseolInsert Start...");
		int result = 0;
		try {
			result = siseolMapper.siseolInsert(siseol);
		} catch (Exception e) {
			log.info("siseolInsert " + e.getMessage());
		} finally {
			log.info("siseolInsert End...");
		}
		return result;
	}

	// 입력한 수자원정보를 update하는 메소드 by 나희
	@Override
	public int siseolUpdate(Siseol siseol) {
		log.info("siseolUpdate Start...");
		int result = 0;
		try {
			result = siseolMapper.siseolUpdate(siseol);
		} catch (Exception e) {
			log.info("siseolUpdate " + e.getMessage());
		} finally {
			log.info("siseolUpdate End...");
		}
		return result;
	}

	// siseolId에 해당하는 수자원정보를 삭제하는 메소드 by 나희
	@Override
	public int siseolDelete(int siseolId) {
		log.info("siseolDelete Start...");
		int result = 0;
		try {
			result = siseolMapper.siseolDelete(siseolId);
		} catch (Exception e) {
			log.info("siseolDelete " + e.getMessage());
		} finally {
			log.info("siseolDelete End...");
		}
		return result;
	}

	@Override
	public List<Users> userList() {
		System.out.println("SiseolServiceImpl userList start...");
		List<Users> userList = null;
		try { 
			userList = siseolMapper.userList();
			System.out.println("SiseolService userList userList---> " + userList);
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl userList Exception -> " + e.getMessage());
		}
		
		return userList;
	}

	@Override
	public List<Inspection> inspectionList(Inspection inspection) {
		System.out.println("SiseolServiceImpl inspectionInsert start...");
		List<Inspection> inspectionList = null;
		try { 
			inspectionList = siseolMapper.inspectionList(inspection);
			System.out.println("SiseolService inspectionList inspectionList---> " + inspectionList);
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl inspectionList Exception -> " + e.getMessage());
		}
		return inspectionList;
	}

	@Override
	public int inspectionCount(Inspection inspection) {
		System.out.println("SiseolServiceImpl inspectionCount start...");
		int result = 0;
		try { 
			result = siseolMapper.inspectionCount(inspection);
			System.out.println("SiseolService inspectionCount result---> " + result);
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl inspectionCount Exception -> " + e.getMessage());
		}
		return result;
	} 


	 
	
}
