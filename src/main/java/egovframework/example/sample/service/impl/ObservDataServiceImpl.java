package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.ObservData;
import egovframework.example.sample.service.ObservDataService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ObservDataServiceImpl extends EgovAbstractServiceImpl implements ObservDataService {
	private final ObservDataMapper obm;
	
	
	@Override
	public int observCount() {
		int observCount =0;
		
		try {
			observCount = obm.observCount();
			System.out.println("observCount->" +observCount);
			
		} catch (Exception e) {
			System.out.println("observCount e.getMessage()->"+e.getMessage());
		}
	
	
		return observCount;
	}

	@Override
	public List<ObservData> observDataList(ObservData observData) {
		List<ObservData> observDataList = null;
		
		System.out.println("ObservDataServiceImpl observDataList start...");
		
		try {
			
			observDataList = obm.observDataList(observData);
			/*
			 * System.out.println("observ_data --------------"+observData);
			 * System.out.println("observ_data --------------List"+observDataList);
			 */
			
		} catch (Exception e) {
			System.out.println("ObservDataServiceImpl observDataList e.getMessage()->"+e.getMessage());
		}
		
		
		
		
		return observDataList;
	}

	@Override
	public ObservData observdataDetail(int sluice_id,String type, String data_ymd) {
		
		ObservData observDataD = new ObservData();
		
		try {
			observDataD = obm.observdataDetail(sluice_id,data_ymd);
			
			
		} catch (Exception e) {
			System.out.println("ObservDataServiceImpl observDataList e.getMessage()->"+e.getMessage());
		}
		
		
		
		
		return observDataD;
	}

	
	
}
