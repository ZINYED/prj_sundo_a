package com.postgres.sample.dto;

import lombok.Data;

import java.util.Date;

@Data
public class KJO_CheckReport {
	private Integer	 	doc_no;
//	시설물코드
	private String 		facility_code;
//	점검일자
	private String 		check_date;
//	기상상황
	private String 		weather;
//	점검자 소속
	private String 		user_department;
//	직급
	private String 		user_position;
//	이름
	private String 		user_name;
//	점검위치
	private String 		check_category;
//	점검항목
	private String 		check_item;
//	평가 점수
	private String 		check_grade	;
//	비고
	private String 		note;
//	점검결과
	private String 		check_result;
//	특이사항	
	private String 		spec_memo;	
//	작성일	
	private Date 		create_datetime;	
//	수정일	
	private Date 		modify_datetime;	
	

}
