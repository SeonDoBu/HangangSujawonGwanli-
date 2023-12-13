package egovframework.example.sample.service;

import java.util.List;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Siseol;

public interface SiseolService {

	int              count();
	List<Siseol>     siseolList();
	List<Commoncode> commonList();
	List<District>   districtList();
	List<Gigwan>     gigwanList();

}
