package egovframework.example.sample.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Users;
import egovframework.example.sample.service.GigwanService;
import egovframework.example.sample.service.UsersService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AuthController {
	
	private final UsersService us;
	private final GigwanService gs;
	
	@PostMapping(value = "loginCheck.do")
	public String loginCheck(Users userInfo, Model model, HttpSession session) {
		log.info("loginCheck Start...");
		String url = "";
		
		try {
			// userInfo.setSmall_code(3);
			Users user = us.getUserById(userInfo);
			
			// 해당하는 회원이 있는 경우
			if (user != null) {
				log.info("user_id:{}, small_code:{}", user.getUser_id(), user.getSmall_code());
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
						url = "redirect:adminInfo.do";
						break;
					default:
						url = "redirect:home.do";
						break;
				}
				session.setAttribute("user_id", user.getUser_id());
				session.setAttribute("user_name", user.getName());
				session.setAttribute("user_role", user.getSmall_code());
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
	
	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session, Model model) {
		log.info("logout Start...");
		String url = "";
		
		try {
			session.invalidate(); // session에 저장된 로그인 정보 삭제
			url = "redirect:home.do";
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			log.info("logout End...");
		}
		
		return url;
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
		log.info("joinForm Start...");
		try {
			List<Gigwan> gigwanList = gs.gigwanList();
			model.addAttribute("gigwanList", gigwanList);
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			log.info("joinForm End...");
		}
		
		return "joinForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "checkDuplicateId", method = RequestMethod.POST)
	public String checkDuplicateId(String id) {
		log.info("checkDuplicateId Start...");
		String msg = "";
		
		try {
			int result = us.checkDuplicateId(id);
			if(result == 0) {
				msg = "사용 가능한 아이디입니다.";
			} else {
				msg = "중복된 아이디입니다.";
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			log.info("checkDuplicateId End...");
		}
		
		return msg;
	}
	
}
