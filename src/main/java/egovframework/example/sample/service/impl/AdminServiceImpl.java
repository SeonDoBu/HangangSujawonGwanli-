package egovframework.example.sample.service.impl;


import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Notice;
import egovframework.example.sample.dto.Users;
import egovframework.example.sample.service.AdminService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
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
	public List<Notice> getNoticeAllList(Notice notice) {
		List<Notice> noticeAllList = adminDao.getNoticeAllList(notice);
		
		return noticeAllList;
	}
	
	@Override
	public Notice getNoticeFindOne(int noticeId) {
		Notice noticeFindOne = adminDao.getNoticeFindOne(noticeId);
		return noticeFindOne;
	}

	@Override
	public int updateAdNoti(Notice notice) {
		int updateCount = 0 ;
		try {
			log.info("updateAdNoti=>"+notice.getNotice_id());
			updateCount = adminDao.updateAdNoti(notice);
		} catch (Exception e) {
			System.out.println("AdminServiceImpl updateAdNoti e.getMessage()->"+e.getMessage());
		}
		return updateCount;
	}

	@Override
	public int insertNotice(Notice notice) {
		int insertNotice = 0; 
		
		try {
			insertNotice = adminDao.insertNotice(notice);
			
			
		} catch (Exception e) {
			System.out.println("insertNotice e.getMessage()->"+ e.getMessage());
		}
		return insertNotice;
	}

	@Override
	public int updateUser(Users users) {
		int updateCount = 0;
		
		try {
			
			updateCount = adminDao.updateUser(users);
			
		} catch (Exception e) {
			System.out.println("updateUser e.getMessage()->"+e.getMessage());
		}
		
		
		
		return updateCount;
	}

	@Override
	public int countgigwan() {
		
		int countgigwan = adminDao.countgigwan();
		return countgigwan;
	}

	@Override
	public List<Gigwan> gigwanList(Gigwan gigwan) {
	List<Gigwan> gigwanList = adminDao.gigwanList(gigwan);
		
		return gigwanList;
	}

	@Override
	public Gigwan gigwanDetail(int gigwan_id) {
		Gigwan gigwan = new Gigwan();
		
		try {
			gigwan = adminDao.gigwanDetail(gigwan_id);
		} catch (Exception e) {
			System.out.println("adminServiceImpl gigwanDetail e.getMessage()->>"+e.getMessage());
		}
		
		
		
		return gigwan;
	}

	@Override
	public int updateGigwan(Gigwan gigwan) {
		int updateCount = 0;
		try {
			log.info("updateGigwan=>"+gigwan.getGigwan_id());
			updateCount = adminDao.updateGigwan(gigwan);
		} catch (Exception e) {
			System.out.println("AdminServiceImpl updateAdNoti e.getMessage()->"+e.getMessage());
		}
		return updateCount;
	}

	@Override
	public int deleteAdNoti(Notice notice) {
		int deleteCount = 0;
		
		try {
			log.info("deleteAdNoti"+notice.getNotice_id());
			deleteCount = adminDao.deleteAdNoti(notice);
		} catch (Exception e) {
			System.out.println("AdminServiceImpl deleteAdNoti e.getMessage()->"+e.getMessage());
		}
		
		
		return deleteCount;
	}

}
