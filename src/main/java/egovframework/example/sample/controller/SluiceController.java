package egovframework.example.sample.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;

import egovframework.example.sample.dto.Paging;

import egovframework.example.sample.dto.ObservData;

import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.service.CommoncodeService;
import egovframework.example.sample.service.DistrictService;
import egovframework.example.sample.service.ObservDataService;
import egovframework.example.sample.service.SiseolService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.example.sample.dto.Sluice;
import egovframework.example.sample.service.SluiceService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SluiceController {

	// 수자원시설물 목록으로 이동 by 나희
	private final CommoncodeService commoncodeService;
	private final DistrictService   districtService;
	private final SiseolService     siseolSerivce;
	private final SluiceService 	ss;
	private final ObservDataService obs;
	
	
	// 수자원시설물 목록으로 이동

	@RequestMapping(value = "sujawonList.do")
	public String sujawonList(Siseol siseol, String currentPage, Model model) {
		log.info("sujawonList.do Start...");
		try {
			// 시설물 종류 select box 옵션 만들기
			Commoncode cc = new Commoncode();
			cc.setBig_code(2); // 시설물 종류 big_code 강제 지정
			List<Commoncode> siseolType = commoncodeService.commoncodeList(cc);
			
			// 행정구역 select box 옵션 만들기
			List<District> districtList = districtService.districtList();
			
			// 조건에 해당하는 시설물 총 개수 구하기
			int totalSiseol = siseolSerivce.count(siseol);
			
			// 페이징 처리
			Paging page = new Paging(totalSiseol, currentPage);
			siseol.setStart(page.getStart());
			siseol.setEnd(page.getEnd());
			
			// 조건에 해당하는 시설물 리스트 가져오기
			List<Siseol> siseolList = siseolSerivce.siseolList(siseol);
			
			model.addAttribute("page", page);
			model.addAttribute("totalSiseol", totalSiseol);
			model.addAttribute("siseolType", siseolType);
			model.addAttribute("districtList", districtList);
			model.addAttribute("siseolList", siseolList);
			model.addAttribute("currentPage", currentPage);
			
		} catch (Exception e) {
			log.info("sujawonList.do" + e.getMessage());
		} finally {
			log.info("sujawonList.do End...");
		}
		return "sluice/sujawonList";
	}

	@RequestMapping(value = "sujawonDetail.do")
	public String sujawonDetail(int siseolId, Model model) {
		log.info("sujawonDetail Start...");
		try {
			// 시설물 종류 select box 옵션 만들기
			Commoncode cc = new Commoncode();
			cc.setBig_code(2); // 시설물 종류 big_code 강제 지정
			List<Commoncode> siseolType = commoncodeService.commoncodeList(cc);
						
			// 행정구역 select box 옵션 만들기
			List<District> districtList = districtService.districtList();
			
			Siseol siseol = siseolSerivce.siseolDetail(siseolId);
			
			model.addAttribute("siseolType", siseolType);
			model.addAttribute("districtList", districtList);
			model.addAttribute("siseol", siseol);
			
		} catch (Exception e) {
			log.info("sujawonDetail " + e.getMessage());
		} finally {
			log.info("sujawonDetail End...");
		}
		return "sluice/sujawonDetail";
	}

	@RequestMapping(value = "sujawonInsertForm.do")
	public String sujawonInsertForm() {
		return "sluice/sujawonInsert";
	}

	@RequestMapping(value = "sujawonInsert.do")
	public String sujawonInsert() {
		return "sluice/sujawonList";
	}

	@RequestMapping(value = "sujawonUpdate.do")
	public String sujawonUpdate() {
		return "sluice/sujawonDetail";
	}

	@RequestMapping(value = "sujawonDelete.do")
	public String sujawonDelete() {
		return "sluice/sujawonList";
	}

	@RequestMapping(value = "sujawonStatistics.do")
	public String sujawonStatistics() {
		return "sujawonStatistics";
	}

	
	
	
	@GetMapping(value = "/sluiceMain")
	public String SluiceMain(Model model) {
	
	
	return "sluice/sluiceMain";
	
	}
	
	
	@GetMapping(value = "sluiceList")
	public String SluiceList(Sluice sluice,ObservData observData,  Model model) {
	

		int SluiceCount = ss.sluiceCount();
		int ObservCount = obs.observCount();
		
		
		List<Sluice> SluiceList = ss.sluiceList(sluice);
		List<ObservData> ObservDataList = obs.observDataList(observData);
		/* System.out.println(SluiceList); */
		//조회 
		model.addAttribute("SluiceList",SluiceList);
		model.addAttribute("ObservDataList",ObservDataList);
		//count
		model.addAttribute("SluiceCount",SluiceCount);
		model.addAttribute("ObservCount",ObservCount);
		
	return "sluice/sluiceList";
	

	}

	@GetMapping("sluiceInsert")
	public String insertFormMove(Model model) {

		return "/sluice/sluiceInsert";
	}

	@PostMapping(value = "sluiceInsert1")
	public String sluiceInsert(@ModelAttribute Sluice sluice, Model model, Sluice sluice_id) {

		int insertResult = 0;

		insertResult = ss.insertSluice(sluice);

		System.out.println(sluice.getSluice_id());
		System.out.println(sluice.getClass());

		return "/sluice/sluiceInsert";
	}

	@GetMapping(value = "/sluiceDetail")
	public String sluiceDetail(int sluice_id, Model model) {
		System.out.println("sluiceDetail start");

		Sluice sluice = ss.sluiceDetail(sluice_id);

		model.addAttribute("sluice", sluice);

		return "sluice/sluiceDetail";
	}

	@PostMapping(value = "updateSluice")
	public String updateSluice(@ModelAttribute Sluice sluice, Model model) {
		
		int updateCount = ss.updateSluice(sluice);
		
		System.out.println("updateSluice"+sluice.getMapx());
		System.out.println("updateSluice"+sluice.getSluice_id());
		model.addAttribute("upcnt",updateCount);
		model.addAttribute("sluice",sluice);
		
		return "redirect:sluiceList";
		
	}
	

	
	
	
	//관측 데이터 시작 
	@GetMapping(value = "/ObservDataList")
	public String ObservDataList(Sluice sluice,ObservData observData,Model model) {
	
		int SluiceCount = ss.sluiceCount();
		int ObservCount = obs.observCount();
		
		
		List<Sluice> SluiceList = ss.sluiceList(sluice);
		List<ObservData> ObservDataList = obs.observDataList(observData);
		
		System.out.println("========================"+ObservDataList);
		System.out.println("========================="+observData.getName());
		System.out.println("-------------");
		/* System.out.println(SluiceList); */
		//조회 
		model.addAttribute("SluiceList",SluiceList);
		model.addAttribute("ObservDataList",ObservDataList);
		model.addAttribute("ObservData",observData);
		//count
		model.addAttribute("SluiceCount",SluiceCount);
		
		model.addAttribute("ObservCount",ObservCount);
		
	return "sluice/sluiceTypeList";
	
	}
	


}
