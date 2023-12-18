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
		} catch (Exception e) {
			System.out.println("ObservDataServiceImpl observDataList e.getMessage()->"+e.getMessage());
		}
		
		
		
		
		return observDataList;
	}

	@Override
	public ObservData observdataDetail(ObservData observData) {
		
		ObservData observDataD = new ObservData();
		System.out.println("value00 service"+observData.getValue00());
		try {
			observDataD = obm.observdataDetail(observData);
			
			
		} catch (Exception e) {
			System.out.println("ObservDataServiceImpl observDataList e.getMessage()->"+e.getMessage());
		}
		
		
		
		
		return observDataD;
	}

	@Override
	public int updateObserv(ObservData observData) {
		int updateCount2 = 0;
		
		try {
			log.info("updateobserv=>"+observData.getSluice_id());
			updateCount2 = obm.updateObserv(observData);
			
		} catch (Exception e) {
			System.out.println("ObservDataServiceImpl observDataList e.getMessage()->"+e.getMessage());
		}
		
		

		return updateCount2;
	}




	
	
}
