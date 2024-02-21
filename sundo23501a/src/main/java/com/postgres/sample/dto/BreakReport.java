package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BreakReport {
	private Integer doc_no;
	private String 	user_id;
	private String 	facility_category;
	private String 	facility_code;
	
	private String 	check_target;
	
	private String 	m_category;
	private String 	s_category;
	
	private String 	subject;
	
	private String 	break_date;
	
	private String 	break_cause;
	private String 	current_state;
	private String 	handling_flag;
	private String 	handling_content;
	
	private String 	future_plan;
	
	private String 	create_datetime;
	private String 	modify_datetime;
	
	// 페이징 작업
	private int rn;
	private String search;   	private String keyword;
	private String pageNum;		private int total;
	private int start; 		 	private int end;
	
	// 조회용
	private String	user_name;
}
