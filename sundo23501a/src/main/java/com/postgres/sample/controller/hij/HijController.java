package com.postgres.sample.controller.hij;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.postgres.sample.dto.CategoryVO;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Observation;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.Paging;
import com.postgres.sample.dto.WaterGate;
import com.postgres.sample.dto.WaterLevel;
import com.postgres.sample.service.hij.HijService;


import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class HijController {
    private static final Logger Logger = LoggerFactory.getLogger(HijController.class);


    private final HijService hs;

    //--------------------------------------------------------------------------------------
    // 1. 관측소 - 목록
    //--------------------------------------------------------------------------------------
    // 관측소 목록
    @GetMapping("/observation_find")
    public String observation_find(Observation observation, String currentPage,  Model model) {
        System.out.println("HijController observation_find START");
        int  totalCount = hs.totalCount();	// 관측소 목록 갯수


        Paging page = new Paging(totalCount, currentPage);
        observation.setStart(page.getStart());
        observation.setEnd(page.getEnd());


        List<Observation> observationList = hs.observationList(observation); //관측소 목록 리스트
        System.out.println("observationList size : " + observationList.size());


        List<Code> codeListM = hs.getCodeList("observe_method"); //관측방식리스트
        List<Organization> orgList = hs.getOrgList(); //운영기관 리스트
        CategoryVO categoryVO = new CategoryVO();
        categoryVO.setTbl_name("organization");
        categoryVO.setField_name("org_area");
        List<Organization> categoryList = hs.getCategoryList(categoryVO); //행정구역 리스트

        System.out.println("size:" + categoryList.size());

        model.addAttribute("totalCount", totalCount);
        model.addAttribute("page", page);
        model.addAttribute("observationList", observationList);
        model.addAttribute("observation" ,observation);
        model.addAttribute("CodeObserveMethod",codeListM);
        model.addAttribute("OrgList", orgList);
        model.addAttribute("categoryList", categoryList);


        return "/system2/observation_sys/observation_find";
    }

    // 관측소 등록 페이지
    @GetMapping("/observation_create")
    public String observation_create(Observation observation, Model model) {
        System.out.println("HijController observation_create START");
        List<Code> codeListM = hs.getCodeList("observe_method"); //관측방식리스트
        List<Code> codeListT = hs.getCodeList("observe_type"); //관측유형리스트
        List<Organization> orgList = hs.getOrgList(); //운영기관 리스트

        List<WaterGate> categoryList = hs.waterGateList(); //표준하천이름 가져오기

        model.addAttribute("CodeObserveMethod",codeListM);
        model.addAttribute("CodeObserveType", codeListT);
        model.addAttribute("OrgList", orgList);
        model.addAttribute("categoryList", categoryList);

        return "/system2/observation_sys/observation_create";
    }

    // 관측소 등록 시행
    @PostMapping("ob_create")
    public String obCreate(Observation observation, Model model) {
        System.out.println("HijController obCreate START");


        System.out.println("observe_post : "+ observation.getObserve_post());
        System.out.println(" river_code: "+ observation.getRiver_code());
        System.out.println(" observe_type: "+ observation.getObserve_type());
        System.out.println("latitude : "+ observation.getLatitude());
        System.out.println(" longitude: "+ observation.getLongitude());
        System.out.println(" observe_method: "+ observation.getObserve_method());
        System.out.println(" org_code: "+ observation.getOrg_code());
        System.out.println(" org_area: "+ observation.getOrg_area());

        int createResult = hs.obCreate(observation);

        return "redirect:/observation_find";
    }

    // 관측소 상세페이지 조회
    @GetMapping("/observation_detail")
    public String observationDetail (Observation observation, Model model) {
        System.out.println("HijController observationDetail START");

        Observation getObservation = hs.getObservation(observation);

        model.addAttribute("observation", getObservation);
        return "/system2/observation_sys/observation_detail";
    }

    // 관측소 수정 조회 페이지
    @GetMapping("observation_edit")
    public String observationEdit (Observation observation, Model model) {
        System.out.println("HijController observationEdit START");

        Observation getObservation = hs.getObservation(observation);
        List<Code> codeListM = hs.getCodeList("observe_method"); //관측방식리스트
        List<Code> codeListT = hs.getCodeList("observe_type"); //관측유형리스트
        List<Organization> orgList = hs.getOrgList(); //운영기관 리스트

        List<WaterGate> categoryList = hs.waterGateList(); //표준하천이름 가져오기

        model.addAttribute("observation", getObservation);
        model.addAttribute("CodeObserveMethod",codeListM);
        model.addAttribute("CodeObserveType", codeListT);
        model.addAttribute("OrgList", orgList);
        model.addAttribute("categoryList", categoryList);

        return "/system2/observation_sys/observation_edit";
    }

    // 관측소 수정 시행
    @PostMapping("ob_edit")
    public String obEdit(Observation observation, Model model) {
        System.out.println("HijController obEdit START");

        int editResult = hs.obEdit(observation);
        System.out.println("Observe_code : "+ observation.getObserve_code());

        model.addAttribute("observation", observation);

        return "redirect:/observation_detail?observe_code="+observation.getObserve_code();
    }

    // 관측소 삭제 시행
    @ResponseBody
    @RequestMapping(value = "/ob_delete")
    public int obDelete(Observation observation, Model model, HttpServletRequest request) {
        System.out.println("HijController obDelete START");
        int deleteResult = 0;

        deleteResult = hs.obDelete(observation);

        return deleteResult;
    }
    //--------------------------------------------------------------------------------------
// 2. 관측소 - 시자료
//--------------------------------------------------------------------------------------
    // 시자료 목록
    @GetMapping("/time_find")
    public String time_find(WaterLevel waterLevel, String currentPage, Model model) {
        System.out.println("HijController time_find START");


        int totalCount= hs.waterLevelTotal();

        Paging page = new Paging(totalCount, currentPage);
        waterLevel.setStart(page.getStart());
        waterLevel.setEnd(page.getEnd());

        List<WaterLevel> waterLevelList = hs.waterLevelList(waterLevel);	// waterLevel 리스트

        model.addAttribute("totalCount", totalCount);
        model.addAttribute("page", page);
        model.addAttribute("waterLevelList", waterLevelList);
        model.addAttribute("waterLevelListSize", waterLevelList.size());
        return "/system2/observation_sys/time_find";



    }
}