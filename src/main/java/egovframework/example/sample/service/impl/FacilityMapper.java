package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.ActionRp;
import egovframework.example.sample.dto.Alarm;
import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.GojangRp;
import egovframework.example.sample.dto.Siseol;

@Mapper
public interface FacilityMapper {
	
	// 고장/조치 보고서 리스트
	List<GojangRp>	troubleList();
	// 시설물 종류에 따른 시설물 코드 
	List<Siseol> selectSmallCode(int small_code);
	// 시설물 코드 리스트
	List<Siseol> siseolCodeList();
	// 알람 리스트
	List<Alarm> alarmList(int siseol_id);
	// 고장 보고서 등록
	int rpWriteAction(GojangRp gojangRp);
	// 조치 보고서 리스트
	List<ActionRp> actionList();
	// 고장보고서 시설물코드
	List<GojangRp> selectSmallCodeGP(int small_code);
	// 고장 보고서 상세 
	GojangRp gojangInfo(int siseol_id);
	// 조치 보고서 등록
	int Action(ActionRp actionRp);
	// 조치 보고서 상세
	ActionRp actionInfo(int action_id);

	
}
