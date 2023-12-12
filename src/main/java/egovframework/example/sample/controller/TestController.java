package egovframework.example.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import egovframework.example.sample.service.TestService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TestController {

	private final TestService ts;
	
	@GetMapping("/test")
	public String test(Model model) {
		
		int testcount = ts.testcount();
		
		model.addAttribute("testcount",testcount);
		
		return "test";
	}
}
