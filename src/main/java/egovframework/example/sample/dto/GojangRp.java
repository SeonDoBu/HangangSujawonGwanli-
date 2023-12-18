package egovframework.example.sample.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class GojangRp {
	// 고장 보고서 

	private int    		siseol_id;  	 // 시설물코드
	private int    		gojang_id;  	 // 고장보고서코드
	private String 		user_id;		 // 작성자
	private Date 		created_at; 	 // 작성일 
	private String		title;			 // 제목
	private Date		gojang_date;	 // 고장일
	private String		gojang_cause;	 // 고장 원인
	private String		curr_status;	 // 현재상황
	private String 		immediate_action;// 즉시처리
	private String		future_plan; 	 // 향후계획
	private String 		file_name;		 // 첨부파일
	private int			alarm_id;		 // 알람코드
	
	private int 		rn;				 // 순번
}
