package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.Commoncode;

@Mapper("commoncodeMapper")
public interface CommoncodeMapper {

	List<Commoncode> searchList(Commoncode cc);

}
