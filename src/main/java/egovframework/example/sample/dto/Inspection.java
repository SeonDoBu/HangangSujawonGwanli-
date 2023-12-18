package egovframework.example.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Inspection {
	private long insp_id;            // 점검ID
    private String user_id;          // 점검자
    private long siseol_id;          // 시설물코드
    private Date insp_date;          // 점검일
    private String weather;          // 기상상황
    private String insp_result;      // 점검결과
    private String special_note;     // 특이사항
    private String insp_record;      // 점검일지파일
    private String up1_score;        // 상류면1점수
    private String up1_note;         // 상류면1비고
    private String up2_score;        // 상류면2점수
    private String up2_note;         // 상류면2비고
    private String up3_score;        // 상류면3점수
    private String up3_note;         // 상류면3비고
    private String up4_score;        // 상류면4점수
    private String up4_note;         // 상류면4비고
    private String down1_score;      // 하류면1점수
    private String down1_note;       // 하류면1비고
    private String down2_score;      // 하류면2점수
    private String down2_note;       // 하류면2비고
    private String down3_score;      // 하류면3점수
    private String down3_note;       // 하류면3비고
    private String down4_score;      // 하류면4점수
    private String down4_note;       // 하류면4비고
    private String inspec1_score;    // 검사량1점수
    private String inspec1_note;     // 검사량1비고
    private String inspec2_score;    // 검사량2점수
    private String inspec2_note;     // 검사량2비고
    
    //조회용
    private String dept; 	 // 점검자 소속
    private String position; // 점검자 직급
    private String name;	 // 점검자 이름
}
