package com.postgres.sample.service.hij;

import java.util.List;

import com.postgres.sample.dto.CategoryVO;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Observation;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.WaterGate;
import com.postgres.sample.dto.WaterLevel;

public interface HijService {

	// 1. 관측소 - 목록
	List<Code> getCodeList(String field_name);	//코드 리스트
	int totalCount();	// 관측소 목록 갯수
	List<Observation> observationList(Observation observation); //관측소 목록 리스트
	List<Organization> getOrgList();	//기관코드, 기관명칭 가져오기
	List<Organization> getCategoryList(CategoryVO categoryVO);	// 특정 Table에서 필요한거 가져오기
	int obCreate(Observation observation);	//관측소 등록
	List<WaterGate> waterGateList(); //river_code, river_name 가져오기
	Observation getObservation(Observation observation);	//관측소 정보
	int obEdit(Observation observation);	// 수정시행
	int obDelete(Observation observation);	// 삭제시행
	
	// 2. 관측소 - 시자료
	
	List<WaterLevel> waterLevelList(WaterLevel waterLevel);//시자료 목록
	int waterLevelTotal();


}
