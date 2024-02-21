package com.postgres.sample.dto;

import lombok.Data;

@Data
public class FileAttach {
	private String 	tbl_name;
	private Integer doc_no;
	private Integer attach_no;
	private String 	attach_name;
	private String 	attach_path;
	private String 	attach_saved_name;
	
}
