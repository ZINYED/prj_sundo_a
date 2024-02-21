package com.postgres.sample.controller.ljh;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.postgres.sample.dto.ActionReport;
import com.postgres.sample.dto.Alarm;
import com.postgres.sample.dto.BreakReport;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Paging;
import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.ljh.LjhService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LjhController {
	
	private final LjhService ljhService;

	// 고장/조치결과보고 > 고장 보고서 목록
	@RequestMapping("/error_report_list")
	public String errorRptList(String currentPage, Model model) {
		System.out.println("LjhController errorReportList Start");
		
		List<BreakReport> breakReportList = new ArrayList<BreakReport>();
		breakReportList = ljhService.getErrorRptList();
		
		// 페이징 작업
		int total = breakReportList.size();
		
		Paging paging = new Paging(total, currentPage, 10);
		BreakReport breakRpt = new BreakReport();
		breakRpt.setStart(paging.getStart());
		breakRpt.setEnd(paging.getEnd());
		
		List<BreakReport> breakRptList = ljhService.getBreakRptListPage(breakRpt);
		
		model.addAttribute("breakReportList", breakRptList);
		model.addAttribute("page", paging);
		
		return "/system3/ljh/water_resources/error/error_report_list";
	}
	
	// 고장 보고서 작성 페이지로 이동
	@RequestMapping("/error_report_write_form")
	public String errorRptWriteForm(Model model) {
		System.out.println("LjhController errorReportWriteForm Start");
		
		List<WaterResources> waterCategory = new ArrayList<WaterResources>();
		waterCategory = ljhService.getWaterCategory();
		
		List<Code> checkCodeList = new ArrayList<Code>();
		checkCodeList = ljhService.getCheckCode();
		
		model.addAttribute("waterCategory", waterCategory);
		model.addAttribute("checkCodeList", checkCodeList);
		
		return "/system3/ljh/water_resources/error/error_report_write";
	}
	
	// 고장보고서 작성 페이지에서 시설물 종류(facility_category) 선택 시 AJAX 실행 - 시설물 코드 SELECT
	@ResponseBody
	@RequestMapping("/get_facility_code")
	public List<WaterResources> getWRCode(String facility_category) {
		System.out.println("LjhController getWRCode Start");
		
		List<WaterResources> wrCodeList = new ArrayList<WaterResources>();
		wrCodeList = ljhService.getWRCode(facility_category);
		
		// System.out.println("WRCodeList" + wrCodeList);
		
		return wrCodeList;
	}
	
	// 고장보고서 작성 페이지에서 시설물 코드(facility_code) 선택 시 AJAX 실행 - 알람내역 SELECT
	@ResponseBody
	@RequestMapping("/get_alarm")
	public List<Alarm> getAlarm(String facility_code) {
		System.out.println("LjhController getAlarm Start");
		
		List<Alarm> alarmList = new ArrayList<Alarm>();
		alarmList = ljhService.getAlarm(facility_code);
		
		return alarmList;
	}
	
	// 고장 보고서 INSERT
	@RequestMapping("/error_report_write")
	public String errorRptWrite(BreakReport breakReport, Alarm alarm) {
		System.out.println("LjhController errorReportWrite Start");
		
//		System.out.println("breakReport -> " + breakReport);
//		System.out.println("alarm -> " + alarm);
		
		if (breakReport.getHandling_flag() == null) {
			breakReport.setHandling_flag("N");
			System.out.println("breakReport.getHandling_flag() -> " + breakReport.getHandling_flag());
			
			int result = ljhService.errorRptWrite(breakReport, alarm);
		} else {
			int result = ljhService.errorRptWrite(breakReport, alarm);
		}
		
		return "redirect:/error_report_list";
	}
	
	// 고장 보고서 상세
	@RequestMapping("/error_report_read")
	public String errorRptRead(Integer doc_no, Model model) {
		System.out.println("LjhController errorRptRead Start");
		
		BreakReport breakReport = new BreakReport();
		breakReport = ljhService.getErrorRpt(doc_no);		// 고장 보고서 SELECT
		
		List<Alarm> alarmList = new ArrayList<Alarm>();
		alarmList = ljhService.getErrorRptAlarm(doc_no);	// 고장 보고서에 등록된 알람 SELECT
		
		model.addAttribute("breakReport", breakReport);
		model.addAttribute("alarmList", alarmList);
		
		return "/system3/ljh/water_resources/error/error_report_read";
	}
	
	// 고장 보고서 수정
	@RequestMapping("/error_report_update_form")
	public String errorRptUpdateForm(Integer doc_no, Model model) {
		System.out.println("LjhController errorRptUpdateForm Start");
		
		List<WaterResources> waterCategory = new ArrayList<WaterResources>();
		waterCategory = ljhService.getWaterCategory();		// 수자원 시설물 카테고리 SELECT
		
		List<Code> checkCodeList = new ArrayList<Code>();
		checkCodeList = ljhService.getCheckCode();			// 점검대상, 중분류, 소분류 SELECT
		
		BreakReport breakReport = new BreakReport();
		breakReport = ljhService.getErrorRpt(doc_no);		// 고장 보고서 SELECT
		
		String facility_category = breakReport.getFacility_category();
		List<WaterResources> wrCodeList = new ArrayList<WaterResources>();
		wrCodeList = getWRCode(facility_category);			// SELECT한 고장 보고서의 시설물 종류에 해당하는 시설물 코드 리스트
		
		String facility_code = breakReport.getFacility_code();
		List<Alarm> alarmList = new ArrayList<Alarm>();
		alarmList = ljhService.getAlarm(facility_code);		// 시설물 코드에 해당하는 알람 전체 SELECT
		
		List<Alarm> rptAlarmList = new ArrayList<Alarm>();
		rptAlarmList = ljhService.getErrorRptAlarm(doc_no);	// 고장 보고서에 등록된 알람 SELECT
		
		model.addAttribute("waterCategory", waterCategory);
		model.addAttribute("checkCodeList", checkCodeList);
		model.addAttribute("breakReport", breakReport);
		model.addAttribute("wrCodeList", wrCodeList);
		model.addAttribute("alarmList", alarmList);
		model.addAttribute("rptAlarmList", rptAlarmList);
		
		return "/system3/ljh/water_resources/error/error_report_update";
	}
	
	// 고장 보고서 수정 실행
	@RequestMapping("/error_report_update")
	public String errorRptUpdate(BreakReport breakReport, Alarm alarm) {
		System.out.println("LjhController errorRptUpdate Start"); 
		
		System.out.println("breakReport -> " + breakReport);
		System.out.println("alarm -> " + alarm);
		
		int result = ljhService.errorRptUpdate(breakReport, alarm);
		
		return "redirect:/error_report_read?doc_no=" + breakReport.getDoc_no();
	}
	
	// 고장 보고서 삭제
	@ResponseBody
	@RequestMapping("/error_report_delete")
	public int errorRptDelete(Integer doc_no) {
		System.out.println("LjhController LjhController Start");
		
		System.out.println("doc_no : " + doc_no);
		int result = ljhService.errorRptDelete(doc_no);
		
		return result;
	}
	
	
//-----------------------------------------------------------------------------------------
	// 고장/조치결과보고 > 조치 결과 보고서 목록
	@RequestMapping("/action_report_list")
	public String actionRptList(String currentPage, Model model) {
		System.out.println("LjhController actionRptList Start");
		
		List<ActionReport> actionReportList = new ArrayList<ActionReport>();
		actionReportList = ljhService.getActionRptList();
		
		// 페이징 작업
		int total = actionReportList.size();
		
		Paging paging = new Paging(total, currentPage, 10);
		ActionReport actionRpt = new ActionReport();
		actionRpt.setStart(paging.getStart());
		actionRpt.setEnd(paging.getEnd());
		
		List<ActionReport> actionRptList = ljhService.getActionRptListPage(actionRpt);
		
		model.addAttribute("actionReportList", actionRptList);
		model.addAttribute("page", paging);
		
		return "/system3/ljh/water_resources/error/action_report_list";
	}
	
	// 조치 결과 보고서 작성
	@RequestMapping("/action_report_write_form")
	public String actionRptWriteForm(Model model) {
		System.out.println("LjhController actionRptWriteForm Start");
		
		List<WaterResources> waterCategory = new ArrayList<WaterResources>();
		waterCategory = ljhService.getWaterCategory();
		
		List<Code> checkCodeList = new ArrayList<Code>();
		checkCodeList = ljhService.getCheckCode();
		
		model.addAttribute("waterCategory", waterCategory);
		model.addAttribute("checkCodeList", checkCodeList);
		
		return "/system3/ljh/water_resources/error/action_report_write";
	}
	
	// 조치 결과 보고서 INSERT
	@RequestMapping("/action_report_write")
	public String actionRptWrite(ActionReport actionReport) {
		System.out.println("LjhController actionRptWrite Start");
		
		int result = ljhService.actionRptWrite(actionReport);
		
		return "redirect:/action_report_list";
	}
	
	// 조치 결과 보고서 상세
	@RequestMapping("/action_report_read")
	public String actionRptRead(Integer doc_no, Model model) {
		System.out.println("LjhController actionRptRead Start");
		
		ActionReport actionRpt = new ActionReport();
		actionRpt = ljhService.getActionRpt(doc_no);
		
		model.addAttribute("actionRpt", actionRpt);
		
		return "/system3/ljh/water_resources/error/action_report_read";
	}
	
	// 조치 결과 보고서 수정
	@RequestMapping("/action_report_update_form")
	public String actionRptUpdateForm(Integer doc_no, Model model) {
		System.out.println("LjhController actionRptUpdateForm Start");
		
		List<WaterResources> waterCategory = new ArrayList<WaterResources>();
		waterCategory = ljhService.getWaterCategory();		// 수자원 시설물 카테고리 SELECT
		
		List<Code> checkCodeList = new ArrayList<Code>();
		checkCodeList = ljhService.getCheckCode();			// 점검대상, 중분류, 소분류 SELECT
		
		ActionReport actionRpt = new ActionReport();
		actionRpt = ljhService.getActionRpt(doc_no);		// 조치 결과 보고서 SELECT
		
		String facility_category = actionRpt.getFacility_category();
		List<WaterResources> wrCodeList = new ArrayList<WaterResources>();
		wrCodeList = getWRCode(facility_category);			// SELECT한 고장 보고서의 시설물 종류에 해당하는 시설물 코드 리스트
		
		model.addAttribute("waterCategory", waterCategory);
		model.addAttribute("checkCodeList", checkCodeList);
		model.addAttribute("actionRpt", actionRpt);
		model.addAttribute("wrCodeList", wrCodeList);
		
		return "/system3/ljh/water_resources/error/action_report_update";
	}
	
	// 조치 결과 보고서 수정 실행
	@RequestMapping("/action_report_update")
	public String actionRptUpdate(ActionReport actionReport) {
		System.out.println("LjhController actionRptUpdate Start");
		
		int result = ljhService.actionRptUpdate(actionReport);
		
		return "redirect:/action_report_read?doc_no=" + actionReport.getDoc_no();
	}
	
	// 조치 결과 보고서 삭제
	@ResponseBody
	@RequestMapping("/action_report_delete")
	public int actionRptDelete(Integer doc_no) {
		System.out.println("LjhController actionRptDelete Start");
		
		int result = ljhService.actionRptDelete(doc_no);
		
		return result;
	}
	
	
	
}
