package egovframework.example.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {
	private int notice_id;
	private String user_id;
	private String title;
	private String content;
	private Date created_date;
	private String file_name;
	private int readcount;
	
	//조회용
	private String search;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;
	
}
