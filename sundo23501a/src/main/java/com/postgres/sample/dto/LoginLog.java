package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class LoginLog {
	private Integer log_no;
	private String	user_id;
	private Date 	login_datetime;
	private String 	ip;
	private Date 	create_datetime;

}
