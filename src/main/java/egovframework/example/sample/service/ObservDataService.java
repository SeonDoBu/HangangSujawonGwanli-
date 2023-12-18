package egovframework.example.sample.service;

import java.util.List;

import egovframework.example.sample.dto.ObservData;

public interface ObservDataService {

	int observCount();
	List<ObservData> observDataList(ObservData observData);

	int updateObserv(ObservData observData);
	ObservData observdataDetail(ObservData observData);

}
