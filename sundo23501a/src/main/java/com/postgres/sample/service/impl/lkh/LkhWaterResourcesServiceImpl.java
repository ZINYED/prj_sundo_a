package com.postgres.sample.service.impl.lkh;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.OrgArea;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.WaterResources;

import com.postgres.sample.service.impl.dao.lkh.LKH_WaterResourcesDAO;
import com.postgres.sample.service.lkh.WaterResourcesService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LkhWaterResourcesServiceImpl extends EgovAbstractServiceImpl implements WaterResourcesService {
	private final LKH_WaterResourcesDAO waterResourcesDAO;

	@Override
	public List<WaterResources> SelectWaterResourceList(WaterResources resources) {
		return waterResourcesDAO.SelectWaterResourceList(resources);
	}

	@Override
	public List<WaterResources> findfacilityCategory() {
		return  waterResourcesDAO.findfacilityCategory(); 
	
	}

	@Override
	public List<Organization> organizationCategory() {
		return waterResourcesDAO.organizationCategory();
	}

	@Override
	public WaterResources countWaterResource() {
		return waterResourcesDAO.countWaterResource();
	}

	@Override
	public List<Code> facilityCategoryType(String divison) {
		return waterResourcesDAO.facilityCategoryType(divison);
	}

	@Override
	public int waterResourcesInsert(WaterResources waterResources) {
		return waterResourcesDAO.insertWaterResources(waterResources);
	}

	@Override
	public WaterResources waterResourceDetail(String facility_code) {
		return waterResourcesDAO.waterResourceDetail(facility_code);
	}

	@Override
	public List<Integer> doughnutChart() {
		return waterResourcesDAO.doughnutChart();
	}

	@Override
	public List<WaterResources> orgAreaLineGraph() {
		return  waterResourcesDAO.orgAreaLineGraph();
	}

	@Override
	public List<OrgArea> OrgAreaCategory() {
		
		return waterResourcesDAO.OrgAreaCategory();
	}

	
		
}
