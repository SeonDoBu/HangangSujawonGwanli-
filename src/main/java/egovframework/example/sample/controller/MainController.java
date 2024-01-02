package egovframework.example.sample.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.dto.Notice;
import egovframework.example.sample.dto.Paging;
import egovframework.example.sample.service.AdminService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainController {

	private final AdminService as;

	@RequestMapping(value = "home.do")
	public String home() {
		return "home";
	}

	@RequestMapping(value = "info.do")
	public String info() {
		return "info";
	}

	@RequestMapping(value = "notice.do")
	public String notice(Notice notice, String currentPage, Model model) {
		log.info("MainController notice start!");
		int countNotice = as.getNoticeAllCount();
		List<Notice> noticeAllList = null;

		Paging page = new Paging(countNotice, currentPage);
		notice.setStart(page.getStart());
		notice.setEnd(page.getEnd());
		log.info("MainController notice page : {}", page);

		try {
			noticeAllList = as.getNoticeAllList(notice);
			log.info("MainController noticeAllList.size : {}", noticeAllList.size());

			model.addAttribute("noticeAllList", noticeAllList);
			model.addAttribute("page", page);
		} catch (Exception e) {
			log.error("MainController notice Error : {}", e.getMessage());
		}
		log.info("MainController notice end..");

		return "notice";
	}

	@RequestMapping(value = "noticeDetail.do")
	public String noticeDetail(int noticeId, Model model) {
		log.info("MainController noticeDetail start!");
		log.info("MainController noticeDetail noticeId : {}", noticeId);

		Notice noticeFindOne = null;

		try {
			noticeFindOne = as.getNoticeFindOne(noticeId);
			log.info("MainController noticeFindOne.getTitle : {}", noticeFindOne.getTitle());
			model.addAttribute("noticeFindOne", noticeFindOne);
		} catch (Exception e) {
			log.error("MainController noticeDetail Error : {}", e.getMessage());
		}
		log.info("MainController noticeDetail end..");
		return "noticeDetail";
	}

	@RequestMapping(value = "findId.do")
	public String findIdForm() {
		return "findIdPwForm";
	}

	@RequestMapping(value = "findPw.do")
	public String findPwForm(Model model) {
		int searchPw = 1;

		model.addAttribute("searchPw", searchPw);
		return "findIdPwForm";
	}

	@RequestMapping(value = "joinForm.do")
	public String joinForm(Model model) {
		int searchPw = 1;

		model.addAttribute("searchPw", searchPw);
		return "joinForm";
	}
}
