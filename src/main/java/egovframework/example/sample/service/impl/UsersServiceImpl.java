package egovframework.example.sample.service.impl;

import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.Users;
import egovframework.example.sample.service.UsersService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class UsersServiceImpl implements UsersService {
	
	private final UsersMapper usersDao;
	
	@Override
	public Users getUserById(Users userInfo) {
		log.info("loginCheck Start...");
		Users user = new Users();
		try {
			user = usersDao.getUserById(userInfo);
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			log.info("loginCheck End...");
		}
		return user;
	}

	@Override
	public int checkDuplicateId(String id) {
		log.info("checkDuplicateId Start...");
		int result = 0;
		try {
			result = usersDao.checkDuplicateId(id);
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			log.info("checkDuplicateId End...");
		}
		return result;
	}

}
