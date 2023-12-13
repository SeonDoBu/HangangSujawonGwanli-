package egovframework.example.sample.dto;

import lombok.Data;

@Data
public class Commoncode {
	private int    big_code;   // 대분류
	private int    small_code; // 소분류
	private String content;	   // 내용
}
