package egovframework.example.sample.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.ObservData;

@Mapper("observDataMapper")
public interface ObservDataMapper {

	int observCount();

	List<ObservData> observDataList(ObservData observData);

	ObservData observdataDetail(int sluice_id, String data_ymd);

	

	
}
