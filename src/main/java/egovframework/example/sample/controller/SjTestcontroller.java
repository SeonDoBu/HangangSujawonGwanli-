package egovframework.example.sample.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SjTestcontroller {



		
	@GetMapping(value = "/sluiceMain")
	public String sjTest(Model model) {
	
	
	return "sluice/sluiceMain";
	
	}
	
	@GetMapping(value = "/sluiceList")
	public String sumoonList(Model model) {
		
		

		return "sluice/sluiceList";	
	}
	@GetMapping(value = "/sluiceInsert")
	public String sumooninsert(Model model) {
		
		

		return "sluice/sluiceInsert";	
	}
	
	@GetMapping(value = "/sluiceDetail")
	public String sumoonDetail(Model model) {
		
		

		return "sluice/sluiceDetail";	
	}
	@GetMapping(value = "/sluiceTypeList")
	public String sumoonType(Model model) {
		
		

		return "sluice/sluiceTypeList";	
	}
	@GetMapping(value = "/sluiceTypeUpdate")
	public String sumoonTypeUpdate(Model model) {
		
		

		return "sluice/sluiceTypeUpdate";	
	}
	
}
