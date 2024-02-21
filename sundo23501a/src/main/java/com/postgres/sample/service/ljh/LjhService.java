package com.postgres.sample.service.ljh;

import java.util.List;

import com.postgres.sample.dto.ActionReport;
import com.postgres.sample.dto.Alarm;
import com.postgres.sample.dto.BreakReport;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.WaterResources;

public interface LjhService {

	List<BreakReport> 		getErrorRptList();
	List<WaterResources> 	getWaterCategory();
	List<Code> 				getCheckCode();
	List<WaterResources> 	getWRCode(String facility_category);
	List<Alarm> 			getAlarm(String facility_code);
	int 					errorRptWrite(BreakReport breakReport, Alarm alarm);
	BreakReport 			getErrorRpt(Integer doc_no);
	List<Alarm> 			getErrorRptAlarm(Integer doc_no);
	int 					errorRptUpdate(BreakReport breakReport, Alarm alarm);
	int 					errorRptDelete(Integer doc_no);
	List<ActionReport> 		getActionRptList();
	int 					actionRptWrite(ActionReport actionReport);
	ActionReport 			getActionRpt(Integer doc_no);
	int 					actionRptUpdate(ActionReport actionReport);
	int 					actionRptDelete(Integer doc_no);
	List<BreakReport> 		getBreakRptListPage(BreakReport breakRpt);
	List<ActionReport> 		getActionRptListPage(ActionReport actionRpt);
	
	
	
	



	
}
