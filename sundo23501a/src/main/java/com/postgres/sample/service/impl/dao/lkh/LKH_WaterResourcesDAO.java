package com.postgres.sample.service.impl.dao.lkh;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.OrgArea;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.WaterResources;



@Mapper("waterResourcesDAO")
public interface LKH_WaterResourcesDAO {
	
	public List<WaterResources> SelectWaterResourceList(WaterResources waterResources);
	
	public List<WaterResources> findfacilityCategory();
	
	public List<Organization> organizationCategory();
	public List<OrgArea>  OrgAreaCategory();
	
	public WaterResources countWaterResource();
	
	
	public List<Code>	facilityCategoryType(String divison);
	
	public int		insertWaterResources(WaterResources waterResources);


	
	public WaterResources waterResourceDetail(String facility_code);
	public List<Integer> doughnutChart();
	public List<WaterResources> orgAreaLineGraph();
}
