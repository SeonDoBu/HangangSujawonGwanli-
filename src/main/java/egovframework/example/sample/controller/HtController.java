package egovframework.example.sample.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Paging;
import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.dto.Users;
import egovframework.example.sample.service.SiseolService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HtController {

	private final SiseolService siseolService;

	@RequestMapping("test.do")
	public String test(Model model, Siseol siseol) {
		System.out.println("htController Start...");
		try {
			int result = siseolService.count(siseol);
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
			
			int totalSiseol = siseolService.count(siseol);
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
	
	// 점검이력 작성폼
	@RequestMapping("siseoulWriteForm.do")
	public String siseoulWriteForm(Model model, String currentPage, Users users) {
		System.out.println("htController siseoulWriteForm Start...");
		
		//임시로 넣기
		users.setDept("생산부");
		users.setPosition("사원");
		users.setName("조형택");
		
		try {
			model.addAttribute("users", users);
		}catch (Exception e) {
			System.out.println("htController siseoulWriteForm Exception -> " + e.getMessage());
		}
		
		return "/facility/siseolWriteForm";
	}
	
	// 점검이력 작성폼
	@RequestMapping("siseoulWriteForm.do")
	public String siseoulWriteAction(Model model, String currentPage, Users users) {
		System.out.println("htController siseoulWriteAction Start...");
		
		//임시로 넣기
		users.setDept("생산부");
		users.setPosition("사원");
		users.setName("조형택");
		
		try {
			model.addAttribute("users", users);
		}catch (Exception e) {
			System.out.println("htController siseoulWriteAction Exception -> " + e.getMessage());
		}
		
		return "/facility/siseolWriteAction";
	}
	
	// 점검 이력조회
	@RequestMapping("siseoulHistoryCheck.do")
	public String kkk(Model model, String currentPage, Siseol siseol) {
		
		
		return "/facility/siseoulHistoryCheck";
	}
}
