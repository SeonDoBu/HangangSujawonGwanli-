package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.service.SiseolService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SiseolServiceImpl extends EgovAbstractServiceImpl implements SiseolService {
	private final SiseolMapper siseolMapper;

	@Override
	public int count() {
		System.out.println("SiseolService count Start...");
		int result = 0;
		try {
			result = siseolMapper.siseolCount();
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
	
	
}
