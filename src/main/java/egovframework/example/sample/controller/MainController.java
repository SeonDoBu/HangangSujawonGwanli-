package egovframework.example.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	@RequestMapping(value = "home.do")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "info.do")
	public String info() {
		return "info";
	}
	
	@RequestMapping(value = "findId.do")
	public String findIdForm() {
		return "findIdPwForm";
	}
	
	@RequestMapping(value = "findPw.do")
	public String findPwForm() {
		return "findIdPwForm";
	}
}
