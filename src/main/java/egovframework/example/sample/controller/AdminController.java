package egovframework.example.sample.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.dto.Paging;
import egovframework.example.sample.dto.Users;
import egovframework.example.sample.service.AdminService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {

	private final AdminService as;

	@RequestMapping(value = "adminInfo.do")
	public String adminInfo(Users users, String userId, String currentPage, Model model) {
		log.info("AdminController adminInfo start!");
		int countUsers = as.getUsetAllCount();
		log.info("AdminController adminInfo countUsers : {}", countUsers);
		List<Users> userAllList = null;

		Paging page = new Paging(countUsers, currentPage);
		users.setStart(page.getStart());
		users.setEnd(page.getEnd());
		log.info("AdminController adminInfo page : {}", page);
		try {
			userAllList = as.getUserAllList();
			log.info("AdminController adminInfo userAllList.size : {}", userAllList.size());

			model.addAttribute("userAllList", userAllList);

			model.addAttribute("page", page);
		} catch (Exception e) {

		}
		log.info("AdminController adminInfo end..");
		return "admin/adminInfo";
	}

	@RequestMapping(value = "userDetail.do")
	public String UserDetail(String userId, Model model) {
		log.info("AdminController userDetail start!");
		log.info("AdminController userDetail userId : {}", userId);
		Users userFind = null;
		try {
			userFind = as.getUserFindOne(userId);
			log.info("AdminController userDetail userFind.getName : {}", userFind.getName());
			model.addAttribute("userFind", userFind);
		} catch (Exception e) {
			log.error("AdminController userDetail Error : {}", e.getMessage());
		}

		return "admin/adminInfo";
	}
}
