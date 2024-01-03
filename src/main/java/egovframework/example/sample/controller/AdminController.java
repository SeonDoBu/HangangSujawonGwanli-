package egovframework.example.sample.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Notice;
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
	@RequestMapping(value = "gigwan.do")
	public String gigwanList(Gigwan gigwan, Users users, String userId, String currentPage, Model model) {
		log.info("AdminController gigwanList start!");
		int countgigwan = as.countgigwan();
		System.out.println("AdminController countgigwan.size()=??>"+countgigwan);
		log.info("AdminController gigwanList countUsers : {}", countgigwan);
		List<Gigwan> gigwanList = null;

		Paging page = new Paging(countgigwan, currentPage);
		users.setStart(page.getStart());
		users.setEnd(page.getEnd());
		log.info("AdminController gigwanList page : {}", page);
		try {
			gigwanList = as.gigwanList(gigwan);
			log.info("AdminController gigwanList gigwanList.size : {}", gigwanList.size());

			model.addAttribute("gigwanList", gigwanList);
			model.addAttribute("page", page);
		} catch (Exception e) {

		}
		log.info("AdminController gigwanList end..");
		return "admin/gigwanList";
	}
	
	@RequestMapping(value = "gigwanDetail.do")
	public String gigwanDetail(int gigwan_id, Model model) {
		log.info("AdminController gigwanDetail start!");
		log.info("AdminController gigwanDetail userId : {}", gigwan_id);
		Gigwan gigwanDetail = null;
		try {
			gigwanDetail = as.gigwanDetail(gigwan_id);
			log.info("AdminController gigwanDetail gigwanDetail.getName : {}", gigwanDetail.getGigwan_id());
			model.addAttribute("gigwan", gigwanDetail);
		} catch (Exception e) {
			log.error("AdminController gigwanDetail Error : {}", e.getMessage());
		}

		return "admin/gigwanList";
	}
	@PostMapping(value = "updateGigwan.do")
	public String updateGigwan(Gigwan gigwan, Model model) {
		System.out.println("AdMinController updateAdNoti start");
		 
		int updateCount = as.updateGigwan(gigwan);
		
		System.out.println("updateGigwan "+ gigwan.getGigwan_id());
		System.out.println("updateGigwan"+gigwan.getAddress());
		System.out.println("updateGigwan gigwan"+gigwan.getName());
		System.out.println("updateGigwan gigwan"+gigwan.getTel());
		
		model.addAttribute("updateCount", updateCount);
		model.addAttribute("gigwan", gigwan);		
		return "redirect:gigwan.do";
	}
	
	
	
	
	
	@PostMapping(value = "updateUser.do")
	public String updateUser(@ModelAttribute Users users , Model model) {
		
		int updateCount = as.updateUser(users);
		
		model.addAttribute("updateCount", updateCount);
		model.addAttribute("users", users);
		
		
		return "redirect:adminInfo.do";
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

	@RequestMapping(value = "adminNotice.do")
	public String adminNotice(Notice notice, String currentPage, Model model) {
		log.info("AdminController adminNotice start!");
		int countNotice = as.getNoticeAllCount();
		System.out.println("countNotice "+countNotice);
		Paging page = new Paging(countNotice, currentPage);
		notice.setStart(page.getStart());
		notice.setEnd(page.getEnd());
		
		List<Notice> noticeAllList = null;
		log.info("AdminController adminNotice page : {}", page);
		
		try {
			noticeAllList = as.getNoticeAllList(notice);
			log.info("AdminController noticeAllList.size : {}", noticeAllList.size());
			
			model.addAttribute("noticeAllList", noticeAllList);
			model.addAttribute("page", page);
		} catch (Exception e) {
			log.error("AdminController adminNotice Error : {}", e.getMessage());
		}
		log.info("AdminController adminNotice end..");
		
		return "admin/adminNotice";
	}
	
	@RequestMapping(value = "adminNoticeDetail.do")
	public String adminNoticeDetail(Notice notice,int noticeId ,  Model model) {
		log.info("AdminController adminNoticeDetail start!");

		Notice noticeFindOne = null;
		try {
		noticeFindOne  = as.getNoticeFindOne(noticeId);
			
			model.addAttribute("noticeFindOne", noticeFindOne);
		} catch (Exception e) {
			log.error("AdminController adminNoticeDetail Error : {}", e.getMessage());
		}
		log.info("AdminController adminNoticeDetail end..");
		
		return "admin/adminNoticeDetail";
	}
	@PostMapping(value = "updateadNoti.do")
	public String updateAdNoti(Notice notice, Model model) {
		System.out.println("AdMinController updateAdNoti start");
		 
		int updateCount = as.updateAdNoti(notice);
		
		System.out.println("updateadNoti "+ notice.getTitle());
		System.out.println("updateadNoti"+notice.getNotice_id());
		System.out.println("updateadNoti notice"+notice.getCreated_date());
		
		model.addAttribute("updateCount", updateCount);
		model.addAttribute("notice", notice);		
		
		return "redirect:adminNotice.do";
	}
	@PostMapping(value = "deleteNoti.do")
	public String deleteNoti(Notice notice, Model model) {
		System.out.println("AdMinController deleteNoti start");
		
		int deleteCount = as.deleteAdNoti(notice);
		
		System.out.println("delete adNoti");
		
		model.addAttribute("deleteCount", deleteCount);
		model.addAttribute("notice", notice);
		
		return "redirect:adminNotice.do";
	}
	
	
	
	@GetMapping(value = "AdNoticeInsert.do")
	public String NoticeInsertMove(Model model) {

		return "admin/AdNoticeInsert";
	}
	@PostMapping(value = "AdNoticeInsert1.do")
	public String NoticeInsert(@ModelAttribute Notice notice,  Model model) {
			System.out.println("NoticeInsert start");
		int insertResult = 0;
		
		insertResult = as.insertNotice(notice);

		return "admin/AdNoticeInsert";
	}
	
	@GetMapping(value = "aa.do")
	public String aa(Model model) {
		
		return "admin/aa";
	}
	
}
