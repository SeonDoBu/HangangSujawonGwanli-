package egovframework.example.sample.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
<<<<<<< Updated upstream
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.service.CommoncodeService;
import egovframework.example.sample.service.DistrictService;
import egovframework.example.sample.service.SiseolService;
=======
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.example.sample.dto.Sluice;
import egovframework.example.sample.service.SluiceService;
>>>>>>> Stashed changes
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SluiceController {

<<<<<<< Updated upstream
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
=======
	private final SluiceService ss;
	
	@GetMapping(value = "/sluiceList")
	public String SluiceList(Sluice sluice, Model model) {
	
		int SluiceCount = ss.sluiceCount();
		List<Sluice> SluiceList = ss.sluiceList(sluice);
		
		/* System.out.println(SluiceList); */
		 
		model.addAttribute("SluiceList",SluiceList);
		
		model.addAttribute("SluiceCount",SluiceCount);
		
		
	return "sluice/sluiceList";
	
	}
	
	@GetMapping("sluiceInsert")
	public String insertFormMove(Model model) {
		
		
		return "/sluice/sluiceInsert";
	}
	
	
	
	@PostMapping(value = "sluiceInsert1")
	public String sluiceInsert(@ModelAttribute Sluice sluice ,Model model, Sluice sluice_id) {
		
		int insertResult = 0;
		
		insertResult = ss.insertSluice(sluice);
		
		System.out.println(sluice.getSluice_id());
		System.out.println(sluice.getClass());

		return "/sluice/sluiceInsert";	
	}
	@GetMapping(value = "/sluiceDetail")
	public String sluiceDetail(int sluice_id,Model model) {
		System.out.println("sluiceDetail start");
		
		Sluice sluice = ss.sluiceDetail(sluice_id);
		
		
		
		model.addAttribute("sluice",sluice);
		

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
	
	
	
	
>>>>>>> Stashed changes
}
