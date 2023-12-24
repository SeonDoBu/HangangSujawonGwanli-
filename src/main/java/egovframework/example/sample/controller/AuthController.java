package egovframework.example.sample.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.example.sample.dto.Users;
import egovframework.example.sample.service.UsersService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AuthController {
	
	private final UsersService us;
	
	@PostMapping(value = "loginCheck.do")
	public String loginCheck(Users userInfo, Model model, HttpSession session) {
		log.info("loginCheck Start...");
		String url = "";
		
		try {
			userInfo.setSmall_code(1);
			Users user = us.getUserById(userInfo);
			
			// 해당하는 회원이 있는 경우
			if (user != null) {
				log.info("userId:{}, small_code:{}", user.getUser_id(), user.getSmall_code());
				// 권한에 따라 페이지 이동
				switch(user.getSmall_code()) {
					case 1:
						// 실시간 수문정보 관리자
						url = "redirect:sluiceMain";
						break;
					case 2:
						// 수자원시설물 운영 관리자
						url = "redirect:siseoulList.do";
						break;
					case 3:
						// 관리자
						url = "redirect:admininfo.do";
						break;
					default:
						url = "redirect:home.do";
						break;
				}
				session.setAttribute("login", user.getUser_id());
			} else {
				// 해당하는 회원이 없는 경우
				model.addAttribute("errorMsg", "해당하는 회원 정보가 없습니다.");
				url = "redirect:home.do";
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			log.info("loginCheck End...");
		}
		return url;
	}
	
	@PostMapping(value = "logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); // session에 저장된 로그인 정보 삭제
		return "redirect:home.do";
	}
	
}
