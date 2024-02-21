package com.postgres.sample.dto;

import lombok.Data;

import java.util.List;

@Data
public class LKH_WaterResources {
	private String facility_category;
	private String keyword_facility_code;
	private String org_code;
	private String org_area;

	private List<WaterResources>  WaterResourcesList;
	private Paging paging;



}
