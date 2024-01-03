package egovframework.example.sample.dto;

import java.util.Map;

import javax.management.loading.PrivateClassLoader;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class Sluice {
	private int    sluice_id;	// 수문코드(PK)
	private int    district_id; // 행정구역(FK)
	private int    gigwan_id;	// 운영기관(FK)
	private String name;		// 수문명
	private String area;		// 하천주소
	private String address;		// 세부주소
	private double mapx;		// 경도
	private double mapy;		// 위도
	private String is_deleted; //삭제여부
	
	//조회용
	private int    	start;	private int end;  private int currentPage; // 페이징
	private String 	data_ymd;
	private String 	type;
	private double 	value00;
	private double 	value01;
	private double 	value02;
	private double 	value03;
	private double 	value04;
	private double 	value05;
	private double 	value06;
	private double 	value07;
	private double 	value08;
	private double 	value09;
	private double 	value10;
	private double 	value11;
	private double 	value12;
	private double 	value13;
	private double 	value14;
	private double 	value15;
	private double 	value16;
	private double 	value17;
	private double 	value18;
	private double 	value19;
	private double 	value20;
	private double 	value21;
	private double 	value22;
	private double 	value23;
	private String[] typeList;
	private String 	type1;
	private String 	type4;
	private String 	type5;
	private Map<String, Object> chkmap;

	
}
