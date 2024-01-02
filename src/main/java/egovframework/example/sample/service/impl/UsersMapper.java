package egovframework.example.sample.service.impl;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.Users;

@Mapper("userMapper")
public interface UsersMapper {

	Users getUserById(Users userInfo);

	int   checkDuplicateId(String id);

}
