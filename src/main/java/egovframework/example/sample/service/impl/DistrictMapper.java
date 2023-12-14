package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.District;

@Mapper("districtMapper")
public interface DistrictMapper {

	List<District> searchDistrict();

}
