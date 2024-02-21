package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ActionReport {
	private Integer doc_no;
	private String 	user_id;
	private String 	facility_category;
	private String 	facility_code;
	private String 	check_target;
	private String 	m_category;
	private String 	s_category;
	
	
	private String 	break_date;
	private String 	action_date;
	
	private String 	break_content;
	private String 	action_content;
	private String 	spec_memo;
	private String 	future_plan;
	
	
	private String 	create_datetime;
	private String 	modify_datetime;
	
	// 페이징 작업
	private int rn;
	private String search;   	private String keyword;
	private String pageNum;		private int total;
	private int start; 		 	private int end;
	
	// 조회용 추가
	private String	user_name;
}
