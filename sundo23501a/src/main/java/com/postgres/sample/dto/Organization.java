package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Organization {
	private String 	org_code;
	private String 	org_name;
	private String 	org_area;
	private String 	org_addr;
	private String 	org_tel;
	private Date 	create_datetime;
	private Date	modify_datetime;
}
