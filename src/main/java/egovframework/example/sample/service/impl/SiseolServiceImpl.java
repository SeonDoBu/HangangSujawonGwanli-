package egovframework.example.sample.service.impl;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.SiseolService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SiseolServiceImpl implements SiseolService {
	private final SiseolMapper siseolMapper;

	@Override
	public int count() {
		System.out.println("SiseolService Start...");
		int result = siseolMapper.siseolCount();
		System.out.println("SiseolService End...");
		return result;
	}
	
	
}
