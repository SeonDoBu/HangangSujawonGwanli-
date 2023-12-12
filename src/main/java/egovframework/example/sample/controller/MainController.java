package egovframework.example.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	@RequestMapping(value = "home")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "info")
	public String info() {
		return "info";
	}
}
