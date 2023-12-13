package egovframework.example.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.SiseolService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class htController {
	private final SiseolService ss;
	
	@RequestMapping("test.do")
	public String test(Model model) {
		System.out.println("htController Start...");
		try {
			int result = ss.count();
			System.out.println("htController result--> " + result);
			
			model.addAttribute("result", result);
		}catch (Exception e) {
			System.out.println("htController Exception -> " + e.getMessage());
		}
		
		return "siseolTest";
	}
	
	
	
	
}
