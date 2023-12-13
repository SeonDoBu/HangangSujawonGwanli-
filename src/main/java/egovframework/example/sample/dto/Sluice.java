package egovframework.example.sample.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Sluice {
	private int    sluice_id;	// 수문코드(PK)
	private int    district_id; // 행정구역(FK)
	private int    gigwan_id;	// 운영기관(FK)
	private String name;		// 수문명
	private String area;		// 하천주소
	private String address;		// 세부주소
	private double mapx;		// 경도
	private double mapy;		// 위도
}
