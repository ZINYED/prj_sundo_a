package com.postgres.sample.service.impl.dao.kjo;

import com.postgres.sample.dto.*;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface KjoDao {
    List<CheckItemInfo> findAllCheckItemInfo();
    int inputChkList(CheckList checkList);
    CheckList cntChkListByFacilityCode(CheckList chkList);
    CheckReport cntByFacilityCode(CheckReport checkReport);
    List<CheckReport> pageChkReport(CheckReport crt);
    int inputChkReport(CheckReport checkReport);
    CheckReport cntAllReport();
    List<CheckReport> findChkReport();
    List<CheckReport> pageSearchChkReport(CheckReport crt);
    CheckReport cntSearchChkReport(CheckReport cr);
    List<?> SelectObsList();
    List<Organization> findAllOrgList();
    List<OrgArea> findAllOrgArea();
    UserInfo findByUserId(UserInfo ui);
    UserInfo findUserId(UserInfo ui);
    WaterResources cntWaterResource();
    List<WaterResources> findFacilityCategory();
    List<WaterResources> findFacilityAddr();
    List<WaterResources> findWaterResourceLists();
    List<WaterResources> PaingWaterResourceLists(WaterResources wr);
    List<WaterResources> findFacilityAddrbyCategory(WaterResources wr);
    List<WaterResources> searchWaterResources(WaterResources wr);
    WaterResources searchCnt(WaterResources wr);
    WaterResources findWaterResourcesById(WaterResources wr);
}
