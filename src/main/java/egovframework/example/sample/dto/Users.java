package egovframework.example.sample.dto;

import lombok.Data;

@Data
public class Users {
	private String user_id;
	private int big_code;
	private int small_code;
	private int gigwan_id;
	private int password;
	private String name;
	private String email;
	private String tel;
	private String dept;
	private String position;
	private String status;
	
	
	//조회용
	private String content;
	private String search;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;
}
