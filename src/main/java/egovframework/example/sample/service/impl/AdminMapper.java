package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.Users;

@Mapper
public interface AdminMapper {

	List<Users> getUserAllList();

	int getUsetAllCount();

	Users getUserFindOne(String userId);

}
