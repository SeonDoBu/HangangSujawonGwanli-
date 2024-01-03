package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Notice;
import egovframework.example.sample.dto.Users;

@Mapper
public interface AdminMapper {

	List<Users> getUserAllList();

	int getUsetAllCount();

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
