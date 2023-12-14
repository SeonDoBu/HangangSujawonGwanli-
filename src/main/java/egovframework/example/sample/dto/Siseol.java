package egovframework.example.sample.dto;

import lombok.Data;

@Data
public class Siseol {
	
	private int    siseol_id;   // 시설물코드
	private int    big_code;    // 대분류
	private int    small_code;  // 소분류
	private int    district_id; // 행정구역
	private int    gigwan_id;   // 관리기관
	private double mapx;		// 경도
	private double mapy;		// 위도
	private String address;		// 주소
	
	//조회용
	private int    start;	private int end;  private int currentPage; // 페이징
	private String siseolName;	   // 시설물명
	private String gigwanName;	   // 기관명
	private String districtName;   // 행정구역명
}
