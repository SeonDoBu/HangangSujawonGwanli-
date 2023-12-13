package egovframework.example.sample.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Siseol;
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
	
	@RequestMapping("checkResult.do")
	public String checkResult(Model model) {
		System.out.println("htController checkResult Start...");
		try {
			List<Siseol> siseolList = siseolService.siseolList();
			System.out.println("htController siseolList--> " + siseolList);
			
			List<Commoncode> commonList = siseolService.commonList();
			System.out.println("htController commonList--> " + commonList);
			
			List<District> districtList = siseolService.districtList();
			System.out.println("htController districtList--> " + districtList);
			
			List<Gigwan> gigwanList = siseolService.gigwanList();
			System.out.println("htController districtList--> " + districtList);

			model.addAttribute("siseolList", siseolList);
			model.addAttribute("commonList", commonList);
			model.addAttribute("districtList", districtList);
			model.addAttribute("gigwanList", gigwanList);
		} catch (Exception e) {
			System.out.println("htController Exception -> " + e.getMessage());
		}

		return "/facility/fatest";

	}

}
