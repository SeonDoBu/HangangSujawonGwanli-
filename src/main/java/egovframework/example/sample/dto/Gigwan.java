package egovframework.example.sample.dto;

import lombok.Data;

@Data
public class Gigwan {
	private int    gigwan_id;   //기관Id
	private int    district_id; //행정구역
	private String name;		//명칭
	private String address;		//주소
	private String tel;			//전화번호
	private String info;		//소개
}
