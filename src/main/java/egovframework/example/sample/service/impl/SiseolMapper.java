package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Siseol;

@Mapper
public interface SiseolMapper {

	int               siseolCount();
	List<Siseol>      siseolList();
	List<Commoncode>  commonList();
	List<District>    districtList();
	List<Gigwan>      gigwanList();
	
}
