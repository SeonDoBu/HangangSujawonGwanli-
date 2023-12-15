package egovframework.example.sample.service;

import java.util.List;

import egovframework.example.sample.dto.Users;

public interface AdminService {

	List<Users> getUserAllList();

	int getUsetAllCount();

	Users getUserFindOne(String userId);

}
