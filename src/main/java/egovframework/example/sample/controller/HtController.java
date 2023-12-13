package egovframework.example.sample.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
			List<Siseol> list = siseolService.siseolList();
			System.out.println("htController list--> " + list);

			model.addAttribute("list", list);
		} catch (Exception e) {
			System.out.println("htController Exception -> " + e.getMessage());
		}

		return "/facility/fatest";

	}

}
