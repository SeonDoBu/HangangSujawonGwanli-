package egovframework.example.sample.service;

import java.util.List;

import egovframework.example.sample.dto.Notice;
import egovframework.example.sample.dto.Users;

public interface AdminService {
	
	int getUsetAllCount();

	List<Users> getUserAllList();

	Users getUserFindOne(String userId);
	
	int getNoticeAllCount();

	List<Notice> getNoticeAllList();

	Notice getNoticeFindOne(int noticeId);



}
