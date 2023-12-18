package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.ObservData;

@Mapper("observDataMapper")
public interface ObservDataMapper {

	int observCount();

	List<ObservData> observDataList(ObservData observData);

	int updateObserv(ObservData observData);

	ObservData observdataDetail(ObservData observData);

	

	
}
