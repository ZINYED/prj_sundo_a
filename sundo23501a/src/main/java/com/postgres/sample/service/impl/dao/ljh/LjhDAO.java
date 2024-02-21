package com.postgres.sample.service.impl.dao.ljh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import org.springframework.stereotype.Repository;

import com.postgres.sample.dto.ActionReport;
import com.postgres.sample.dto.Alarm;
import com.postgres.sample.dto.BreakReport;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.WaterResources;

import lombok.RequiredArgsConstructor;

@Mapper
public interface LjhDAO {
	
	// 고장/조치결과보고 > 고장 보고서 목록
	public List<BreakReport> ljhGetErrorRptList();
	
	// 수자원 시설물 종류 SELECT
	public List<WaterResources> ljhGetWaterCategory();

	// 고장보고서 작성 시 필요한 점검대상, 중분류, 소분류 SELECT
	public List<Code> ljhGetCheckCode();

	// 고장보고서 작성 페이지에서 시설물 종류(facility_category) 선택 시 선택한 시설물 종류에 맞는 시설물 코드 SELECT
	public List<WaterResources> ljhGetWRCode(String facility_category);

	// 고장보고서 작성 페이지에서 시설물 코드(facility_code) 선택 시 선택한 시설물 코드에 맞는 알람 리스트 SELECT
	public List<Alarm> ljhGetAlarm(String facility_code);

	// 고장보고서(break_report) TBL INSERT
	public int ljhInsertBreakRpt(BreakReport breakReport);

	// 체크한 알람 코드의 'alarm_flag = Y'로 변경
	public int ljhUpdateAlarm(Alarm alarm);

	// 고장보고서 상세 - 고장 보고서 SELECT
	public BreakReport ljhGetErrorRpt(Integer doc_no);

	// 고장보고서 상세 - 고장 보고서에 등록된 알람 SELECT
	public List<Alarm> ljhGetErrorRptAlarm(Integer doc_no);

	// 고장보고서 수정 - break_report TBL
	public int ljhUpdateErrorRpt(BreakReport breakReport);

	// 고장보고서 수정 - alarm TBL
	public int ljhUpdateRptAlarm(Alarm alarms);

	// 고장보고서 삭제 - break_report TBL
	public int ljhDeleteErrorRpt(Integer doc_no);

	// 고장보고서 삭제 - alarm TBL 수정
	public int ljhDeleteRptAlarm(Integer doc_no);

	// 고장/조치결과보고 > 조치 결과 보고서 목록
	public List<ActionReport> ljhGetActionRptList();

	// 조치 결과 보고서 INSERT
	public int ljhInsertActionRpt(ActionReport actionReport);

	// 조치 결과 보고서 상세
	public ActionReport ljhGetActionRpt(Integer doc_no);

	// 조치 결과 보고서 수정
	public int ljhUpdateActionRpt(ActionReport actionReport);

	// 조치 결과 보고서 삭제
	public int ljhDeleteActionRpt(Integer doc_no);

	// 고장 보고서 목록 페이징 작업용
	public List<BreakReport> ljhGetBreakRptListPage(BreakReport breakRpt);

	// 조치 결과 보고서 목록 페이징 작업용
	public List<ActionReport> ljhGetActionRptListPage(ActionReport actionRpt);
	
	
	
	
	
	
	
	




}
