package egovframework.example.sample.service.impl;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.Dept;

@Mapper("deptMapper")
public interface DeptMapper {

	int selectDept();

	Dept findOnd(int deptno);

}

