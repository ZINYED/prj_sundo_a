package com.postgres.sample.controller.lkh;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.LKH_WaterResources;
import com.postgres.sample.dto.OrgArea;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.Paging;
import com.postgres.sample.dto.WaterResources;

import com.postgres.sample.service.lkh.WaterResourcesService;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequiredArgsConstructor

public class LkhController {
	private final WaterResourcesService waterResourcesService;
	@ResponseBody
	@GetMapping("/waterResourcesListA")
	public ResponseEntity<LKH_WaterResources> waterResourcesListA(
			LKH_WaterResources lkh_waterResources,
			@RequestParam(required = false) String currentPage) {
		System.out.println("이건되냐?");


		WaterResources waterResources = new WaterResources();
		waterResources.setTotal(waterResourcesService.countWaterResource().getTotal());
		Paging page = new Paging(waterResources.getTotal(), currentPage, 10);

		waterResources.setStart(page.getStart());
		waterResources.setEnd(page.getEnd());
		List<WaterResources> waterResourcesList = waterResourcesService.SelectWaterResourceList(waterResources);

		LKH_WaterResources lkhWaterResources = new LKH_WaterResources();
		lkhWaterResources.setWaterResourcesList(waterResourcesList);
		lkhWaterResources.setPaging(page);


		return ResponseEntity.ok(lkhWaterResources);
	}


	@GetMapping("/waterResourcesList")
	public String waterResourcesList(
			 LKH_WaterResources lkh_WaterResources,
			 @RequestParam(required = false) String currentPage,
			Model model) {
		
		
		  WaterResources waterResources = new  WaterResources();
		  waterResources.setTotal(waterResourcesService.countWaterResource().getTotal());
		  Paging page  = new Paging(waterResources.getTotal(), currentPage,10);
		  
		  
		  
		  waterResources.setStart(page.getStart());
		  waterResources.setEnd(page.getEnd());

		  List<WaterResources> findfacility_category = waterResourcesService.findfacilityCategory();
		  List<Organization> organization_category= waterResourcesService.organizationCategory();
		  List<OrgArea> orgArea_category = waterResourcesService.OrgAreaCategory();
		  List<WaterResources> waterResourcesList = waterResourcesService.SelectWaterResourceList(waterResources);


		  model.addAttribute("waterResourcesList",waterResourcesList);
		  model.addAttribute("orgArea_category", orgArea_category);
		  model.addAttribute("findfacility_category", findfacility_category);
		  model.addAttribute("organization_category", organization_category);
		  model.addAttribute("page",page);
	
		
		return "system2/lkh/waterResource/waterResourcesList";
			//해버렷다 ...
	}
	

	@GetMapping("/waterResourcesInsertForm")
	public String waterResourcesInsertForm(Model model) {
		
		 
		List<Organization> organization_category= waterResourcesService.organizationCategory();
		List<WaterResources> findfacility_category = waterResourcesService.findfacilityCategory();	
		List<Code> codeList = waterResourcesService.facilityCategoryType("a"); //기본값고정
		List<OrgArea> orgArea_category = waterResourcesService.OrgAreaCategory();
		
		model.addAttribute("organization_category", organization_category);
		model.addAttribute("orgArea_category", orgArea_category);
		model.addAttribute("codeList", codeList);
		model.addAttribute("findfacility_category", findfacility_category);
		return "system2/lkh/waterResource/waterResourceInsetForm";
	}
	
	@ResponseBody
	@GetMapping("/facilityCategoryType")
	public List<Code> facilityCategoryType(String divison) {
		List<Code> codeList = waterResourcesService.facilityCategoryType(divison);
		return codeList;
	}
	
	
	@PostMapping("/waterResourcesInsert")
	public String waterResourcesInsert(WaterResources waterResources) {
		System.out.println(waterResources.getFacility_code());
		System.out.println(waterResources.getFacility_addr());
		System.out.println(waterResources.getFacility_code());
		int result = waterResourcesService.waterResourcesInsert(waterResources);
		System.out.print("결과"+result);
		return "redirect:/waterResourcesList";
	}
	

	@GetMapping("waterResourcesListDetail")
	public String waterResourceDetail(Model  model,String facility_code) {
		WaterResources waterResources = waterResourcesService.waterResourceDetail(facility_code);
		model.addAttribute("waterResources",waterResources);

		return "system2/lkh/waterResource/waterResourceDetail";
	}
	
	
	@GetMapping("/waterResourcesUpdateForm")
	public String waterResourcesUpdateForm(String facility_code ,Model model) {

		WaterResources waterResources = waterResourcesService.waterResourceDetail(facility_code);

		List<Organization> organization_category= waterResourcesService.organizationCategory();
		List<WaterResources> findfacility_category = waterResourcesService.findfacilityCategory();
		List<Code> codeList = waterResourcesService.facilityCategoryType("a"); //기본값고정
		List<OrgArea> orgArea_category = waterResourcesService.OrgAreaCategory();

		model.addAttribute("organization_category", organization_category);
		model.addAttribute("orgArea_category", orgArea_category);
		model.addAttribute("codeList", codeList);
		model.addAttribute("findfacility_category", findfacility_category);
		model.addAttribute("waterResources", waterResources);


		return "system2/lkh/waterResource/waterResourceUpdateForm";
	}
	
	@PostMapping("/waterResourcesUpdate")
	public String waterResourcesUpdate(WaterResources waterResources) {
		/* int result = waterResourcesService.waterResourcesUpdate(waterResources); */
		return "redirect:/waterResourcesList";
	}



	@GetMapping("/waterResourceStatistics")
	public String waterResourceStatistics(Model model){
		return "system2/lkh/waterResource/waterResourceStatistics";
	}


	@ResponseBody
	@GetMapping("/doughnut_chart")
	public List<Integer> waterResourceStatistics(){
		System.out.println("doughnutChart");
		return waterResourcesService.doughnutChart();
	}


	@ResponseBody
	@GetMapping("/orgAreaLineGraph")
	public List<WaterResources> orgAreaLineGraph(){
		System.out.println("orgAreaLineGraph");
		List<WaterResources> abc = waterResourcesService.orgAreaLineGraph();
		return  waterResourcesService.orgAreaLineGraph();

	}

	@GetMapping("/observation_rainfull")
	public List<WaterResources> observation_rainfull(){

		return  waterResourcesService.orgAreaLineGraph();

	}

}
