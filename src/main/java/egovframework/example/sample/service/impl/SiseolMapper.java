package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Inspection;
import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.dto.Users;

@Mapper
public interface SiseolMapper {

	int               siseolCount(Siseol siseol);
	List<Siseol>      siseolList(Siseol siseol);
	List<Commoncode>  commonList();
	List<District>    districtList();
	List<Gigwan>      gigwanList();
	int 			  selectedSiseolCount(Siseol siseol);
	List<Siseol>      selectedSiseolList(Siseol siseol);
	Siseol            siseolDetail(int siseolId);

	int               inspectionInsert(Inspection inspection);
	int               siseolInsert(Siseol siseol);
	int               siseolUpdate(Siseol siseol);
	int               siseolDelete(int siseolId);

	List<Users>       userList();
	List<Inspection>  inspectionList(Inspection inspection);
	int               inspectionCount(Inspection inspection);
	int               getSiseolCount(int smallCode);
	
}
