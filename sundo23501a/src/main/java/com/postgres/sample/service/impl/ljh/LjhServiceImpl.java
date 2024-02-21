package com.postgres.sample.service.impl.ljh;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.postgres.sample.dto.ActionReport;
import com.postgres.sample.dto.Alarm;
import com.postgres.sample.dto.BreakReport;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.impl.dao.ljh.LjhDAO;
import com.postgres.sample.service.ljh.LjhService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LjhServiceImpl extends EgovAbstractServiceImpl implements LjhService {

	private final PlatformTransactionManager transactionManager;
	private final LjhDAO ljhDAO;
	
	
	// 고장/조치결과보고 > 고장 보고서 목록
	@Override
	public List<BreakReport> getErrorRptList() {
		System.out.println("LjhServiceImpl getErrorReportList Start");
		
		List<BreakReport> breakReportList = null;
		breakReportList = ljhDAO.ljhGetErrorRptList();
		System.out.println("LjhServiceImpl getErrorReportList breakReportList.size() : " + breakReportList.size());
		
		return breakReportList;
	}
	
	// 수자원 시설물 종류 SELECT
	@Override
	public List<WaterResources> getWaterCategory() {
		System.out.println("LjhServiceImpl getWaterCategory Start");
		
		List<WaterResources> waterCategory = null;
		waterCategory = ljhDAO.ljhGetWaterCategory();
		
		return waterCategory;
	}

	// 고장보고서 작성 시 필요한 점검대상, 중분류, 소분류 SELECT
	@Override
	public List<Code> getCheckCode() {
		System.out.println("LjhServiceImpl getAlarmCode Start");
		
		List<Code> checkCodeList = null;
		checkCodeList = ljhDAO.ljhGetCheckCode();
		
		return checkCodeList;
	}

	// 고장보고서 작성 페이지에서 시설물 종류(facility_category) 선택 시 선택한 시설물 종류에 맞는 시설물 코드 SELECT
	@Override
	public List<WaterResources> getWRCode(String facility_category) {
		System.out.println("LjhServiceImpl getWRCode Start");

		List<WaterResources> wrCodeList = null;
		wrCodeList = ljhDAO.ljhGetWRCode(facility_category);
		
		return wrCodeList;
	}

	// 고장보고서 작성 페이지에서 시설물 코드(facility_code) 선택 시 선택한 시설물 코드에 맞는 알람 리스트 SELECT
	@Override
	public List<Alarm> getAlarm(String facility_code) {
		System.out.println("LjhServiceImpl getAlarm Start");
		
		List<Alarm> alarmList = null;
		alarmList = ljhDAO.ljhGetAlarm(facility_code);
		
		return alarmList;
	}

	// 고장 보고서 INSERT
	@Override
	public int errorRptWrite(BreakReport breakReport, Alarm alarm) {
		System.out.println("LjhServiceImpl errorReportWrite Start");
		
		int reportInsert = 0;
		int alarmUpdate = 0;

		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			reportInsert = ljhDAO.ljhInsertBreakRpt(breakReport);		// 고장보고서(break_report) TBL INSERT
			System.out.println("errorReportWrite reportInsert : " + reportInsert);
			
			if (alarm.getAlarm_code() != null) {
				String[] alarm_codes = alarm.getAlarm_code().split(",");	// 체크한 알람 , 기준으로 잘라서 배열로 저장
				
				System.out.println("alarm_codes.length : " + alarm_codes.length);
				
				for (int i = 0; i < alarm_codes.length; i++) {
					Alarm alarms = new Alarm();
					alarms.setAlarm_code(alarm_codes[i]);
					
					alarmUpdate += ljhDAO.ljhUpdateAlarm(alarms);		// 체크한 알람 코드의 'alarm_flag = Y'로 변경
				}
			}
			
			System.out.println("errorReportWrite alarmUpdate : " + alarmUpdate);
			
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			System.out.println("LjhServiceImpl errorReportWrite Exception : " + e.getMessage());
		}
		
		return reportInsert + alarmUpdate;
	}

	// 고장 보고서 상세 - 고장 보고서 SELECT
	@Override
	public BreakReport getErrorRpt(Integer doc_no) {
		System.out.println("LjhServiceImpl getErrorRpt Start");
		
		BreakReport breakReport = new BreakReport();
		breakReport = ljhDAO.ljhGetErrorRpt(doc_no);
		System.out.println("LjhServiceImpl getErrorRpt breakReport -> " + breakReport);
		
		return breakReport;
	}

	// 고장 보고서 상세 - 고장 보고서에 등록된 알람 SELECT
	@Override
	public List<Alarm> getErrorRptAlarm(Integer doc_no) {
		System.out.println("LjhServiceImpl getErrorRptAlarm Start");
		
		List<Alarm> alarmList = null;
		alarmList = ljhDAO.ljhGetErrorRptAlarm(doc_no);
		System.out.println("alarmList -> " + alarmList);
		
		return alarmList;
	}

	// 고장 보고서 수정 실행
	@Override
	public int errorRptUpdate(BreakReport breakReport, Alarm alarm) {
		System.out.println("LjhServiceImpl errorRptUpdate Start");
		
		int reportUpdate = 0;
		int alarmUpdate = 0;
		
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			reportUpdate = ljhDAO.ljhUpdateErrorRpt(breakReport);
			System.out.println("LjhServiceImpl errorRptUpdate reportUpdate : " + reportUpdate);
			
			if (alarm.getAlarm_code() != null) {
				String[] alarm_codes = alarm.getAlarm_code().split(",");	// 체크한 알람 , 기준으로 잘라서 배열로 저장
				
				System.out.println("alarm_codes.length : " + alarm_codes.length);
				
				for (int i = 0; i < alarm_codes.length; i++) {
					Alarm alarms = new Alarm();
					alarms.setAlarm_code(alarm_codes[i]);
					alarms.setBreak_report_no(alarm.getBreak_report_no());
										
					alarmUpdate += ljhDAO.ljhUpdateRptAlarm(alarms);		// 체크한 알람의 alarm_flag, break_report_no 변경
				}
			}
			
			System.out.println("LjhServiceImpl errorRptUpdate alarmUpdate : " + alarmUpdate);
			
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			System.out.println("LjhServiceImpl errorRptUpdate Exception : " + e.getMessage());
		}
		
		return reportUpdate + alarmUpdate;
	}

	// 고장 보고서 삭제
	@Override
	public int errorRptDelete(Integer doc_no) {
		System.out.println("LjhServiceImpl errorRptDelete Start");

		int rptResult = 0;
		int alarmResult = 0;
		
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			rptResult = ljhDAO.ljhDeleteErrorRpt(doc_no);		// break_report TBL 삭제
			System.out.println("LjhServiceImpl errorRptDelete rptResult : " + rptResult);
			
			alarmResult = ljhDAO.ljhDeleteRptAlarm(doc_no);		// alarm TBL 수정
			System.out.println("LjhServiceImpl errorRptDelete alarmResult : " + alarmResult);
			
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			System.out.println("LjhServiceImpl errorRptDelete Exception" + e.getMessage());
		}
		
		
		return rptResult + alarmResult;
	}
	
	// 고장/조치결과보고 > 조치 결과 보고서 목록
	@Override
	public List<ActionReport> getActionRptList() {
		System.out.println("LjhServiceImpl getActionRptList Start");
		
		List<ActionReport> actionReportList = null;
		actionReportList = ljhDAO.ljhGetActionRptList();
		System.out.println("LjhServiceImpl getActionRptList actionReportList.size() : " + actionReportList.size());
		
		return actionReportList;
	}

	// 조치 결과 보고서 INSERT
	@Override
	public int actionRptWrite(ActionReport actionReport) {
		System.out.println("LjhServiceImpl actionRptWrite Start");
		
		int result = ljhDAO.ljhInsertActionRpt(actionReport);
		System.out.println("LjhServiceImpl actionRptWrite result : " + result);
		
		return result;
	}

	// 조치 결과 보고서 상세
	@Override
	public ActionReport getActionRpt(Integer doc_no) {
		System.out.println("LjhServiceImpl getActionRpt Start");
		
		ActionReport actionRpt = null;
		actionRpt = ljhDAO.ljhGetActionRpt(doc_no);
		
		System.out.println("LjhServiceImpl getActionRpt actionRpt -> " + actionRpt);
		
		return actionRpt;
	}
	
	// 조치 결과 보고서 수정
	@Override
	public int actionRptUpdate(ActionReport actionReport) {
		System.out.println("LjhServiceImpl actionRptUpdate Start");
		
		int result = ljhDAO.ljhUpdateActionRpt(actionReport);
		System.out.println("LjhServiceImpl actionRptUpdate result -> " + result);
		
		return result;
	}

	// 조치 결과 보고서 삭제
	@Override
	public int actionRptDelete(Integer doc_no) {
		System.out.println("LjhServiceImpl actionRptDelete Start");
		
		int result = ljhDAO.ljhDeleteActionRpt(doc_no);
		System.out.println("LjhServiceImpl actionRptDelete result -> " + result);
		
		return result;
	}

	@Override
	public List<BreakReport> getBreakRptListPage(BreakReport breakRpt) {
		System.out.println("LjhServiceImpl getBreakRptListPage Start");
		
		List<BreakReport> breakRptList = ljhDAO.ljhGetBreakRptListPage(breakRpt);
		System.out.println("LjhServiceImpl getBreakRptListPage breakRptList.size() -> " + breakRptList.size());
		
		return breakRptList;
	}

	@Override
	public List<ActionReport> getActionRptListPage(ActionReport actionRpt) {
		System.out.println("LjhServiceImpl getActionRptListPage Start");
		
		List<ActionReport> actionRptList = ljhDAO.ljhGetActionRptListPage(actionRpt);
		System.out.println("LjhServiceImpl getActionRptListPage actionRptList.size() -> " + actionRptList.size());
		
		return actionRptList;
	}
	
	
	
	
	






	
}
