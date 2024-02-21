package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;
@Data
public class Alarm {
	private String 	alarm_code;
	private String 	alarm_content;
	private String 	alarm_date;
	private String 	facility_code;
	private Integer break_report_no;
	private String 	alarm_flag;
}
