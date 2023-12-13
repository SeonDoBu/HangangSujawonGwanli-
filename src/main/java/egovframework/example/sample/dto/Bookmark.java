package egovframework.example.sample.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Bookmark {
	private String user_id;		// 회원ID(PFK)
	private int    bookmark_id;	// 북마크ID(PK)
	private int    siseol_id;	// 시설물코드
	private int    sluice_id;	// 수문코드
}
