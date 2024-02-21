package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class WaterResources {
	private String 	facility_code;
	private String 	facility_category;
	private String	facility_addr;
	private String	facility_type;

	private String 	org_code;	//운영기관
	private String 	org_area;  //행정구역 코드
	
	private Double 	latitude;
	private Double 	longitude;
	private Date 	create_datetime;
	private Date 	modify_datetime;
	

	//조회용

    private String first_area;
    private String second_area;

	private String org_area_name;// 행정기관 이름
	private String cate_name; 		// ex) 목재댐
	
	private String org_name;	//운영기관 이름

	//그래프 조회용
	private Integer category_1;
	private Integer category_2;
	private Integer category_3;
	private Integer category_4;



	// 페이징 작업
	private String rn;
	private String search;   	private String keyword;
	private String pageNum;		private int total;
	private int start; 		 	private int end;

	

}
