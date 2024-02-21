package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AccessLog {
	private int	 	log_no;
	private String 	program_url;
	private String 	user_id;
	private Date 	access_datetime;
	private String 	ip;
	private Date 	create_datetime;
}
