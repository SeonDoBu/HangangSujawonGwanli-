package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.Sluice;

@Mapper("sluiceMapper")
public interface SluiceMapper {

	int sluiceCount();
	List<Sluice> sluiceList(Sluice sluice);
	
	int insertSluice(Sluice sluice);
	Sluice sluiceDetail(int sluice_id);
	int updateSluice(Sluice sluice);
	List<Sluice> sluiceList1(Sluice sluice);
	
}
