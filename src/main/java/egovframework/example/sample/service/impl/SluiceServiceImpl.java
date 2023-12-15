package egovframework.example.sample.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.Sluice;
import egovframework.example.sample.service.SluiceService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class SluiceServiceImpl extends EgovAbstractServiceImpl implements SluiceService {

	private final SluiceMapper sm;

	@Override	
	public int sluiceCount() {
		int sluiceCount = 0;
		
		try {
			sluiceCount = sm.sluiceCount();
			System.out.println("sluiceCount->"+sluiceCount);
			
		} catch (Exception e) {
			System.out.println("sluicecount e.getMessage()->"+e.getMessage());
		}

		return sluiceCount;
	}

	@Override
	public List<Sluice> sluiceList(Sluice sluice) {
		List<Sluice> sluiceList = null;
		System.out.println("SluiceListServiceImpl SuliceList Start...");
		
		try {
			
			sluiceList = sm.sluiceList("sluiceList", sluice);
			
		} catch (Exception e) {
			System.out.println("SluiceListServiceImpl SuliceList e.getmessage()->"+e.getMessage());
		}
		
		
		
		return sluiceList;
	}

	@Override
	public int insertSluice(Sluice sluice) {
		int insertSluice = 0 ;
		
		System.out.println("SluiceListServiceImpl InsertSluice start..");
		System.out.println(sluice.getSluice_id());
		System.out.println(sluice.getMapx());
		System.out.println(sluice.getMapy());
		System.out.println(sluice.getName());
		System.out.println(sluice.getDistrict_id());
		
		
		try {
			
			insertSluice = sm.insertSluice("insertSluice",sluice);
			
		} catch (Exception e) {
			System.out.println("SluiceListServiceImpl InsertSluice e.getMesaage()->"+e.getMessage());
		}

		return insertSluice;
	}

	@Override
	public Sluice sluiceDetail(int sluice_id) {
		
		Sluice sluice = new Sluice();
		
		try {
			sluice = sm.sluiceDetail("sluiceDetail",sluice_id);
			
			
		} catch (Exception e) {
			System.out.println("SluiceListServiceImpl sluiceDetail e.getMessage()->"+e.getMessage());
		}
		
		
		
		
		return sluice;
	}

	@Override
	public  int updateSluice(Sluice sluice) {
		int updateCount = 0 ;
		
		try {
			
			updateCount = sm.updateSluice("updateSluice",sluice);
			
			
			
		} catch (Exception e) {
			System.out.println("SluiceListServiceImpl updateSluice e.getMessage()->"+e.getMessage());
		}

		return updateCount;
	}


	
	
	
}
