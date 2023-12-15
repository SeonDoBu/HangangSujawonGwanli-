package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.Sluice;

@Mapper("sluiceMapper")
public interface SluiceMapper {

	int sluiceCount();
	List<Sluice> sluiceList(String string, Sluice sluice);
	
	int insertSluice(String string, Sluice sluice);
	Sluice sluiceDetail(String string, int sluice_id);
	int updateSluice(String string, Sluice sluice);
	
}
