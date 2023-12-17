package egovframework.example.sample.service;

import java.util.List;

import egovframework.example.sample.dto.ObservData;

public interface ObservDataService {

	int observCount();
	List<ObservData> observDataList(ObservData observData);
	ObservData observdataDetail(int sluice_id, String type, String data_ymd);
}
