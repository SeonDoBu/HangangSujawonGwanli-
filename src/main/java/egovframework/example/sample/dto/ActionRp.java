package egovframework.example.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ActionRp {

	// 조치 보고서
	
	private int    		siseol_id;  	 // 시설물코드
	private int    		gojang_id;  	 // 고장보고서 코드
	private int 		action_id;		 // 조치보고서 코드
	private String 		user_id;		 // 작성자
	private Date		action_date;	 // 조치일
	private	String		action_note;	 // 조치내역
	private	String		special_note;	 // 특이사항
	private String		future_plan;	 // 향후계획
	private String		file_name;		 // 첨부파일
	
	// 조회 
	private Date 		created_at; 	 // 고장 보고서 작성일 
	private int 		rn;				 // 순번
	
}
