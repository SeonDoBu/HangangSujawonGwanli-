package egovframework.example.sample.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.service.CommoncodeService;
import egovframework.example.sample.service.DistrictService;
import egovframework.example.sample.service.SiseolService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SluiceController {

	private final CommoncodeService commoncodeService;
	private final DistrictService   districtService;
	private final SiseolService     siseolSerivce;

	// 수자원시설물 목록으로 이동
	@RequestMapping(value = "sujawonList.do")
	public String sujawonList(Siseol siseol, Commoncode cc, String currentPage, Model model) {
		log.info("sujawonList.do Start...");
		try {
			cc.setBig_code(12); // 시설물 종류 대분류 강제 지정
			List<Commoncode> siseolType = commoncodeService.commoncodeList(cc);
			List<District> districtList = districtService.districtList();
			List<Siseol> siseolList = siseolSerivce.siseolList(siseol);
			
			model.addAttribute("siseolType", siseolType);
			model.addAttribute("districtList", districtList);
			model.addAttribute("siseolList", siseolList);
		} catch (Exception e) {
			log.info("sujawonList.do" + e.getMessage());
		}
		log.info("sujawonList.do End...");
		return "sluice/sujawonList";
	}
	
	@RequestMapping(value = "sujawonDetail.do")
	public String sujawonDetail() {
		return "sujawonDetail";
	}
	
	@RequestMapping(value = "sujawonInsertForm.do")
	public String sujawonInsertForm() {
		return "sujawonInsert";
	}
	
	@RequestMapping(value = "sujawonInsert.do")
	public String sujawonInsert() {
		return "sujawonList";
	}
	
	@RequestMapping(value = "sujawonUpdate.do")
	public String sujawonUpdate() {
		return "sujawonDetail";
	}
	
	@RequestMapping(value = "sujawonDelete.do")
	public String sujawonDelete() {
		return "sujawonList";
	}
	
	@RequestMapping(value = "sujawonStatistics.do")
	public String sujawonStatistics() {
		return "sujawonStatistics";
	}
}
