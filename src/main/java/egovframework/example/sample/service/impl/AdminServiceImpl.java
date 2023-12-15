package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.Notice;
import egovframework.example.sample.dto.Users;
import egovframework.example.sample.service.AdminService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl extends EgovAbstractServiceImpl implements AdminService {

	private final AdminMapper adminDao;
	
	@Override
	public int getUsetAllCount() {
		int countUsers = adminDao.getUsetAllCount();
		return countUsers;
	}

	@Override
	public List<Users> getUserAllList() {

		List<Users> userAllList = adminDao.getUserAllList();

		return userAllList;
	}



	@Override
	public Users getUserFindOne(String userId) {
		Users userFind = adminDao.getUserFindOne(userId);
		return userFind;
	}
	
	@Override
	public int getNoticeAllCount() {
		int countNotice = adminDao.getNoticeAllCount();
		return countNotice;
	}

	@Override
	public List<Notice> getNoticeAllList() {
		List<Notice> noticeAllList = adminDao.getNoticeAllList();
		return noticeAllList;
	}
	
	@Override
	public Notice getNoticeFindOne(int noticeId) {
		Notice noticeFindOne = adminDao.getNoticeFindOne(noticeId);
		return noticeFindOne;
	}
}
