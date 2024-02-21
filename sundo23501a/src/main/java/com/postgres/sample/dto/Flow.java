package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Flow {
//	유량
//	관측번호(PK)		N/A	INTEGER
//	표준코드(PK)(FK)	N/A	VARCHAR(30)

	private String river_code;
	private Integer observe_year;
	private Integer observe_day;
	private Double january;
	private Double february;
	private Double march;
	private Double april;
	private Double may;
	private Double june;
	private Double july;
	private Double august;
	private Double september;
	private Double october;
	private Double november;
	private Double december;
	

}
