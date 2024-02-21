package com.postgres.sample.service.impl.kjo;

import com.postgres.sample.dto.*;
import com.postgres.sample.service.impl.dao.kjo.KjoDao;
import com.postgres.sample.service.kjo.KjoService;

import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class KjoServiceImpl extends EgovAbstractServiceImpl implements KjoService {

    private final KjoDao KjoDao;

    @Override
    public List<CheckItemInfo> findAllCheckItemInfo() {
        return KjoDao.findAllCheckItemInfo();
    }

    @Override
    public int inputChkList(CheckList checkList) {
        return KjoDao.inputChkList(checkList);
    }

    @Override
    public CheckList cntChkListByFacilityCode(CheckList chkList) {
        return KjoDao.cntChkListByFacilityCode(chkList);
    }

    @Override
    public CheckReport cntByFacilityCode(CheckReport checkReport) {
        return KjoDao.cntByFacilityCode(checkReport);
    }

    @Override
    public int inputChkReport(CheckReport checkReport) {
        return KjoDao.inputChkReport(checkReport);
    }

    @Override
    public CheckReport cntAllReport() {
        return KjoDao.cntAllReport();
    }

    @Override
    public List<CheckReport> findChkReport() {
        return KjoDao.findChkReport();
    }

    @Override
    public List<CheckReport> pageChkReport(CheckReport crt) {
        return KjoDao.pageChkReport(crt);
    }

    @Override
    public List<CheckReport> pageSearchChkReport(CheckReport crt) {
        return KjoDao.pageSearchChkReport(crt);
    }

    @Override
    public CheckReport cntSearchChkReport(CheckReport cr) {
        return KjoDao.cntSearchChkReport(cr);
    }

    @Override
    public List<?> SelectObsList() {
        return KjoDao.SelectObsList();
    }

    @Override
    public List<Organization> findAllOrgList() {
        return KjoDao.findAllOrgList();
    }

    @Override
    public List<OrgArea> findAllOrgArea() {
        return KjoDao.findAllOrgArea();
    }

    @Override
    public UserInfo findByUserId(UserInfo ui) {
        return KjoDao.findByUserId(ui);
    }

    @Override
    public UserInfo findUserId(UserInfo ui) {
        return KjoDao.findUserId(ui);
    }

    @Override
    public WaterResources cntWaterResource() {
        return KjoDao.cntWaterResource();
    }

    @Override
    public List<WaterResources> findFacilityCategory() {
        return KjoDao.findFacilityCategory();
    }

    @Override
    public List<WaterResources> findFacilityAddr() {
        return KjoDao.findFacilityAddr();
    }

    @Override
    public List<WaterResources> findWaterResourceLists() {
        return KjoDao.findWaterResourceLists();
    }

    @Override
    public List<WaterResources> PaingWaterResourceLists(WaterResources wr) {
        return KjoDao.PaingWaterResourceLists(wr);
    }

    @Override
    public List<WaterResources> findFacilityAddrbyCategory(WaterResources wr) {
        return KjoDao.findFacilityAddrbyCategory(wr);
    }

    @Override
    public List<WaterResources> searchWaterResources(WaterResources wr) {
        return KjoDao.searchWaterResources(wr);

    }

    @Override
    public WaterResources searchCnt(WaterResources wr) {
        return KjoDao.searchCnt(wr);
    }

    @Override
    public WaterResources findWaterResourcesById(WaterResources wr) {
        return KjoDao.findWaterResourcesById(wr);
    }
}
