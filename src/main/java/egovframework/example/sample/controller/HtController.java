package egovframework.example.sample.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.service.Paging;
import egovframework.example.sample.service.SiseolService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HtController {

	private final SiseolService siseolService;

	@RequestMapping("test.do")
	public String test(Model model) {
		System.out.println("htController Start...");
		try {
			int result = siseolService.count();
			System.out.println("htController result--> " + result);

			model.addAttribute("result", result);
		} catch (Exception e) {
			System.out.println("htController Exception -> " + e.getMessage());
		}


		return "/facility/siseolTest";
	}
	
	// 시설물 리스트조회
	@RequestMapping("siseoulList.do")
	public String siseoulList(Model model, String currentPage, Siseol siseol) {
		System.out.println("htController siseoulList Start...");
		try {
			
			int totalSiseol = siseolService.count();
			// Paging 작업 
			Paging page = new Paging(totalSiseol, currentPage);
			System.out.println("page.getStart()-->"+page.getStart() );
			System.out.println("page.getEnd()-->"+page.getEnd() );
			siseol.setStart(page.getStart());
			siseol.setEnd(page.getEnd());
			
			// 시설물 리스트
			List<Siseol> siseolList = siseolService.siseolList(siseol);
			System.out.println("htController siseolList--> " + siseolList);
			
			// 시설물 종류
			List<Commoncode> commonList = siseolService.commonList();
			System.out.println("htController commonList--> " + commonList);
			
			// 행정기관 종류
			List<District> districtList = siseolService.districtList();
			System.out.println("htController districtList--> " + districtList);
			
			// 관리기관 종류
			List<Gigwan> gigwanList = siseolService.gigwanList();
			System.out.println("htController districtList--> " + districtList);

			model.addAttribute("siseolList", siseolList);
			model.addAttribute("commonList", commonList);
			model.addAttribute("districtList", districtList);
			model.addAttribute("gigwanList", gigwanList);
			model.addAttribute("siseol", siseol);
			model.addAttribute("page", page);
		} catch (Exception e) {
			System.out.println("htController Exception -> " + e.getMessage());
		}

		return "/facility/siseolList";

	}
	
	// 조건 선택된 시설물 리스트 조회
	@RequestMapping("selectedSiseolList.do")
	public String selectedSiseolList(Model model, String currentPage, Siseol siseol) {
		System.out.println("htController selectedSiseolList Start...");
		try {
			
			int selectedTotalSiseol = siseolService.selectedCount(siseol);
			System.out.println("selectedTotalSiseol---> " + selectedTotalSiseol);
			// Paging 작업 
			Paging page = new Paging(selectedTotalSiseol, currentPage);
			System.out.println("page.getStart()-->"+page.getStart() );
			System.out.println("page.getEnd()-->"+page.getEnd() );
			siseol.setStart(page.getStart());
			siseol.setEnd(page.getEnd());
			
			// 시설물 리스트
			List<Siseol> selectedSiseolList = siseolService.selectedSiseolList(siseol);
			System.out.println("htController selectedSiseolList--> " + selectedSiseolList);
			
			// 시설물 종류
			List<Commoncode> commonList = siseolService.commonList();
			System.out.println("htController commonList--> " + commonList);
			
			// 행정구역 종류
			List<District> districtList = siseolService.districtList();
			System.out.println("htController districtList--> " + districtList);
			
			// 관리기관 종류
			List<Gigwan> gigwanList = siseolService.gigwanList();
			System.out.println("htController districtList--> " + districtList);

			model.addAttribute("siseolList", selectedSiseolList);
			model.addAttribute("commonList", commonList);
			model.addAttribute("districtList", districtList);
			model.addAttribute("gigwanList", gigwanList);
			model.addAttribute("siseol", siseol);
			model.addAttribute("page", page);
		} catch (Exception e) {
			System.out.println("htController Exception -> " + e.getMessage());
		}

		return "/facility/siseolList";

	}

}
