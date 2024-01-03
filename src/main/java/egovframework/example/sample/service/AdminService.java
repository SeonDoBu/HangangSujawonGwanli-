package egovframework.example.sample.service;

import java.util.List;

import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Notice;
import egovframework.example.sample.dto.Users;

public interface AdminService {
	
	int getUsetAllCount();

	List<Users> getUserAllList();

	Users getUserFindOne(String userId);
	
	int getNoticeAllCount();


	Notice getNoticeFindOne(int noticeId);

	int updateAdNoti(Notice notice);

	int insertNotice(Notice notice);

	List<Notice> getNoticeAllList(Notice notice);

	int updateUser(Users users);

	int countgigwan();

	List<Gigwan> gigwanList(Gigwan gigwan);

	Gigwan gigwanDetail(int gigwan_id);

	int updateGigwan(Gigwan gigwan);

	int deleteAdNoti(Notice notice);





}
