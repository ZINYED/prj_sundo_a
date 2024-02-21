package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CheckReport {
	private Integer	 	doc_no;
	private String 		facility_code;
	private String 		check_date;
	private String 		weather;	
	private String 		user_id;	
	private String 		check_result;
	
	private String 		spec_memo;	
	private String 		create_datetime;
	private String 		modify_datetime;

	//	조회용
	private String 		user_name;
	private String 		facility_category;
	private String 		org_name;
	private String 		org_area_name;
	private String 		user_department;
	private String 		firstdate;
	private String 		secdate;
	private String 		currentPage;



	// 페이징 작업
	private String rn;
	private String search;   	private String keyword;
	private String pageNum;		private int total;
	private int start; 		 	private int end;
	

}
