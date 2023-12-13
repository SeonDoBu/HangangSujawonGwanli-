package egovframework.example.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value = "adminInfo.do")
	public String adminInfo(Model model) {
		return "admin/adminInfo";
	}
}
