package egovframework.example.sample.service;

import java.util.List;

import egovframework.example.sample.dto.ObservData;
import egovframework.example.sample.dto.Sluice;

public interface SluiceService {

	int sluiceCount();

	List<Sluice> sluiceList(Sluice sluice);
	int insertSluice(Sluice sluice);

	Sluice sluiceDetail(int sluice_id);

	int updateSluice(Sluice sluice);

	List<Sluice> sluiceList1(Sluice sluice);


	
	
}
