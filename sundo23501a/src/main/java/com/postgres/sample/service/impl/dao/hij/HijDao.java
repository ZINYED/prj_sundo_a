package com.postgres.sample.service.impl.dao.hij;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.CategoryVO;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Observation;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.WaterGate;
import com.postgres.sample.dto.WaterLevel;

@Mapper
public interface HijDao {
	
	// 1. 관측소 - 목록
	public int ijTotalCount();
	public List<Observation> ijObservationList(Observation observation);
	public List<Code> ijGetCodeList(String field_name);
	public List<Organization> ijGetOrgList();
	public List<Organization> ijGetCategoryList(CategoryVO categoryVO);
	public int ijObCreate(Observation observation);
	public Observation ijGetObservation(Observation observation);
	public List<WaterGate> ijWaterGateList();
	public int ijObEdit(Observation observation);	//관측소 수정시행
	public int ijObDelete(Observation observation);	// 관측소 삭제
	
	// 2. 관측소 - 시자료
	public List<WaterLevel> ijWaterLevelList(WaterLevel waterLevel);//수위정보
	public int ijWaterLevelTotal();
	
}
