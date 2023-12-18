package egovframework.example.sample.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import egovframework.example.sample.dto.Sluice;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SjTestcontroller {



	@GetMapping(value = "/sluiceTypeList")
	public String sumoonType(Model model) {
		
		

		return "sluice/sluiceTypeList";	
	}
	@GetMapping(value = "/sluiceTypeUpdate")
	public String sumoonTypeUpdate(Model model) {
		
		

		return "sluice/sluiceTypeUpdate";	
	}
	
}
