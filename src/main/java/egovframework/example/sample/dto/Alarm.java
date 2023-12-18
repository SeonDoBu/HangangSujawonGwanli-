package egovframework.example.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Alarm {
	
	private int 	alarm_id;	// 알람코드
	private int 	big_code;	// 대분류
	private	int		small_code;	// 소분류
	private	int		siseol_id; 	// 시설물코드
	private int		gojang_id;	// 고장보고서코드
	private	Date	alarm_time;	// 알람일시
	private String	content;	// 내용
	

}
