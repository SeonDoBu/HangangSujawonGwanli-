package egovframework.example.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SluiceController {

	@RequestMapping(value = "sujawonList.do")
	public String sujawonList() {
		return "sujawonList";
	}
	
	@RequestMapping(value = "sujawonDetail.do")
	public String sujawonDetail() {
		return "sujawonDetail";
	}
	
	@RequestMapping(value = "sujawonInsertForm.do")
	public String sujawonInsertForm() {
		return "sujawonInsert";
	}
	
	@RequestMapping(value = "sujawonInsert.do")
	public String sujawonInsert() {
		return "sujawonList";
	}
	
	@RequestMapping(value = "sujawonUpdate.do")
	public String sujawonUpdate() {
		return "sujawonDetail";
	}
	
	@RequestMapping(value = "sujawonDelete.do")
	public String sujawonDelete() {
		return "sujawonList";
	}
	
	@RequestMapping(value = "sujawonStatistics.do")
	public String sujawonStatistics() {
		return "sujawonStatistics";
	}
}
