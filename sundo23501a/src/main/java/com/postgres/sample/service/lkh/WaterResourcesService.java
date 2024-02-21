package com.postgres.sample.service.lkh;

import java.util.List;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.OrgArea;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.WaterResources;

public interface WaterResourcesService {
	
	
	 List<WaterResources> SelectWaterResourceList(WaterResources waterResources);
	 
	 List<WaterResources> findfacilityCategory();
	 
	 List<Organization> organizationCategory();
	 
	 WaterResources countWaterResource();
	 
	 List<Code> facilityCategoryType(String division);
	 List<OrgArea>  OrgAreaCategory();
	 
	 int  waterResourcesInsert(WaterResources waterResources);

	 WaterResources waterResourceDetail(String facility_code);
	List<Integer> doughnutChart();
	List<WaterResources> orgAreaLineGraph();
}
