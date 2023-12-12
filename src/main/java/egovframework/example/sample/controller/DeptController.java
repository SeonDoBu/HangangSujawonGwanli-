package egovframework.example.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.dto.Dept;
import egovframework.example.sample.service.DeptService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeptController {
	private final DeptService ds;
	
	@RequestMapping(value = "findTest.do")
	public String find(Model model) throws Exception {
		System.out.println("find 컨트롤러 시작!!");
		
		int deptno = 2;
		
		Dept findUser = ds.findOnd(deptno);
		
		model.addAttribute("deptInfo", findUser);

		System.out.println(findUser.getDname());
		System.out.println("find 컨트롤러 끝!!");
		return "result2";
	}

	@RequestMapping(value = "countTest.do")
	public String count(Model model) throws Exception {
		System.out.println("count 컨트롤러 시작!!");

		int totalCnt = ds.count();  

		model.addAttribute("cnt", totalCnt);

		System.out.println("count : " + totalCnt);
		System.out.println("count 컨트롤러 끝!!");
		return "result";
	}
	

}
