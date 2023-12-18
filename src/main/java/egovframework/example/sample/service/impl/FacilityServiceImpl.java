package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.ActionRp;
import egovframework.example.sample.dto.Alarm;
import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.GojangRp;
import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.service.FacilityService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FacilityServiceImpl extends EgovAbstractServiceImpl implements FacilityService{
	
	private final FacilityMapper fm;
	
	// 고장/조치 보고서 리스트
	@Override
	public List<GojangRp> troubleList() {
		List<GojangRp> troubleList = fm.troubleList();
		return troubleList;
	}
	
	// 시설물 종류에 따른 시설물 코드
	@Override
	public List<Siseol> selectSmallCode(int small_code) {
		List<Siseol> selectSmallCode = fm.selectSmallCode(small_code);
		return selectSmallCode;
	}

	// 시설물 코드 리스트
	@Override
	public List<Siseol> siseolCodeList() {
		List<Siseol> siseolCodeList = fm.siseolCodeList();
		return siseolCodeList;
	}
	// 시설물 코드에 따른 알람 리스트
	@Override
	public List<Alarm> alarmList(int siseol_id) {
		List<Alarm> alarmList = fm.alarmList(siseol_id);
		return alarmList;
	}
	// 고장 보고서 등록
	@Override
	public int rpWriteAction(GojangRp gojangRp) {
		int rpWriteAction = fm.rpWriteAction(gojangRp);
		return rpWriteAction;
	}
	// 조치 보고서 리스트
	@Override
	public List<ActionRp> actionList() {
		List<ActionRp> actionList = fm.actionList();
		return actionList;
	}
	
	

}
