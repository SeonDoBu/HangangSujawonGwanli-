package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

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
	public List<Siseol> siseolList() {
		System.out.println("SiseolServiceImpl siseolList start...");
		List<Siseol> list = null;
		try {
			list = siseolMapper.siseolList();
			System.out.println("SiseolService siseolList list---> " + list);
		}catch (Exception e) {
			System.out.println("SiseolServiceImpl siseolList Exception -> " + e.getMessage());
		}
		return list;
	}
	
	
}
