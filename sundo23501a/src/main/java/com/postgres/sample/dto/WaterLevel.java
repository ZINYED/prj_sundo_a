package com.postgres.sample.dto;



import java.sql.Date;

import lombok.Data;

@Data
public class WaterLevel {
//	관측번호(PK)			N/A	Double
//	표준코드(PK)(FK)		N/A	VARCHAR(30)
//	관측일시				N/A	DATE


	private String river_code;
	private Date observe_date;
	private Double hour_01;
	private Double hour_02;
	private Double hour_03;
	private Double hour_04;
	private Double hour_05;
	private Double hour_06;
	private Double hour_07;
	private Double hour_08;
	private Double hour_09;
	private Double hour_10;
	private Double hour_11;
	private Double hour_12;
	private Double hour_13;
	private Double hour_14;
	private Double hour_15;
	private Double hour_16;
	private Double hour_17;
	private Double hour_18;
	private Double hour_19;
	private Double hour_20;
	private Double hour_21;
	private Double hour_22;
	private Double hour_23;
	private Double hour_24;
	
	//조회용
	private String 	observe_post;
	private Integer observe_code;

	//페이징작업
	private String rn;
	private String search;   	private String keyword;
	private String pageNum;		private int total;
	private int start; 		 	private int end;
}


