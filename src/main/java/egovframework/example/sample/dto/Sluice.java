package egovframework.example.sample.dto;

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
	
	
	//조회용
	private String data_ymd;
	private String type;
	private int 	value00;
	private int 	value01;
	private int 	value02;
	private int 	value03;
	private int 	value04;
	private int 	value05;
	private int 	value06;
	private int 	value07;
	private int 	value08;
	private int 	value09;
	private int 	value10;
	private int 	value11;
	private int 	value12;
	private int 	value13;
	private int 	value14;
	private int 	value15;
	private int 	value16;
	private int 	value17;
	private int 	value18;
	private int 	value19;
	private int 	value20;
	private int 	value21;
	private int 	value22;
	private int 	value23;

	
	
}
