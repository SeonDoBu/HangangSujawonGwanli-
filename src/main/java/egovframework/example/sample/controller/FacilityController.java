package egovframework.example.sample.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.sample.dto.ActionRp;
import egovframework.example.sample.dto.Alarm;
import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.GojangRp;
import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.service.FacilityService;

@Controller
public class FacilityController {
	// 시설물관리정보 
	
	private final FacilityService fs; 
	
	public FacilityController(FacilityService fs) {
		this.fs = fs;
	}
	
	// 고장/조치 결과 보고서 리스트
	@GetMapping("/troubleList.do")
	public String troubleList(Model model) {
		
		List<GojangRp> troubleList = fs.troubleList();
		
		model.addAttribute("troubleList",troubleList);
		
		return "facilityStat/troubleList";
	}
	
	// 시설물 종류에 따른 시설물 코드
	@PostMapping("/selectSmallCode.do")
	@ResponseBody
	public List<Siseol> selectSmallCode(@RequestParam int small_code){
		List<Siseol> selectSmallCode = fs.selectSmallCode(small_code);
		
		System.out.println(selectSmallCode);
		return selectSmallCode;
	}
	
	
	// 고장 보고서 작성
	@GetMapping("/rpWrite.do")
	public String rpWrite(Model model) {
		// 시설물 코드
		List<Siseol> siseolCodeList = fs.siseolCodeList();
		
		model.addAttribute("siseolCodeList",siseolCodeList);
		
		return "facilityStat/rpWrite";
	}
	
	// 시설물 코드에 따른 알람 리스트
	@PostMapping("/alarmList.do")
	@ResponseBody
	public List<Alarm> alarmList(@RequestParam int siseol_id) {
		System.out.println(siseol_id);
		List<Alarm> alarmList = fs.alarmList(siseol_id);
		System.out.println(alarmList);
		
		return alarmList;
	}
	
	// 고장 보고서 등록
	@PostMapping("/rpWriteAction.do")
	public String rpWriteAction(@ModelAttribute GojangRp gojangRp, MultipartFile file_name ,Model model) {
		
		String immediate_action = gojangRp.getImmediate_action();
		
		if(immediate_action == null) {
			gojangRp.setImmediate_action("0");
		}
		
		int rpWriteAction = fs.rpWriteAction(gojangRp);
		
		model.addAttribute("rpWriteAction",rpWriteAction);
		
		return "redirect:troubleList.do";
	}
	
	// 조치 보고서 리스트
	@GetMapping("/actionList.do")
	public String actionList(Model model) {
		
		List<ActionRp> actionList = fs.actionList();
		
		model.addAttribute("actionList",actionList);
		
		return "facilityStat/actionList";
	}
	
	// 조치 보고서 작성
	@GetMapping("/actionWrite.do")
	public String actionWrite(Model model) {
			
		return "facilityStat/actionWrite";
	}
	
	// 고장보고서 시설물코드
	@PostMapping("/selectSmallCodeGP.do")
	@ResponseBody
	public List<GojangRp> selectSmallCodeGP(@RequestParam int small_code){
		List<GojangRp> selectSmallCodeGP = fs.selectSmallCodeGP(small_code);
		
		System.out.println(selectSmallCodeGP);
		return selectSmallCodeGP;
	}
	
	// 고장 보고서 상세 
	@GetMapping("/gojangInfo.do")
	public String gojangInfo(@RequestParam int siseol_id, Model model) {
		
		GojangRp gojangInfo = fs.gojangInfo(siseol_id);
		
		model.addAttribute("gojangInfo",gojangInfo);
		
		return "facilityStat/gojangInfo";
	}
	
	// 조치 보고서 시설물 코드 선택시
	@GetMapping("/actionWriteGetGP.do")
	public String actionWriteGetGP(@RequestParam int siseol_id, Model model) {
		
		GojangRp actionWriteGetGP =  fs.gojangInfo(siseol_id);
		
		model.addAttribute("actionWriteGetGP",actionWriteGetGP);
		
		return "facilityStat/actionWriteGetGP";
	}
	
	// 조치 보고서 등록
	@PostMapping("/Action.do")
	public String Action(@ModelAttribute ActionRp actionRp, Model model) {
		
		int Action = fs.Action(actionRp);
		
		model.addAttribute("actionList",Action);
		
		return "redirect:actionList.do";
	}
	
	// 조치 보고서 상세 
	@GetMapping("/actionInfo.do")
	public String actionInfo(@RequestParam int action_id, Model model) {
		
		ActionRp actionInfo = fs.actionInfo(action_id);
		
		model.addAttribute("actionInfo",actionInfo);
		
		return "facilityStat/actionInfo";
	}
}
