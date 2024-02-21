package com.postgres.sample.dto;

import lombok.Data;

@Data
public class CheckList {
	private Integer doc_no;
	private String 	facility_code;
	private String 	check_category;
	private String 	check_item;
	private String 	check_grade	;
	private String 	note;
	private Integer checklistist_no;

	//	조회용
	private int		total;

}
