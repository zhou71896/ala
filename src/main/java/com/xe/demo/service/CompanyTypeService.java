package com.xe.demo.service;

import com.github.pagehelper.page.PageMethod;
import com.xe.demo.common.annotation.ServiceLog;
import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.common.utils.AppUtil;
import com.xe.demo.common.utils.DateUtil;
import com.xe.demo.mapper.CompanyTypeMapper;
import com.xe.demo.model.CompanyTypeEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Rock on 2017/9/5.
 */
@Service
public class CompanyTypeService extends   AbstratService<CompanyTypeEntity> {
    @Autowired
    private CompanyTypeMapper companyTypeMapper;

    @Override
    @ServiceLog("查询公司类型列表")
    public PageAjax<CompanyTypeEntity> queryPage(PageAjax<CompanyTypeEntity> page, CompanyTypeEntity companyTypeEntity) {
        PageMethod.startPage(page.getPageNo(), page.getPageSize());
        List<CompanyTypeEntity> list = companyTypeMapper.queryList(companyTypeEntity);
        return AppUtil.returnPage(list);
    }

    @ServiceLog("添加公司类型")
    public AjaxResult saveCompanyType(CompanyTypeEntity companyTypeEntity) {
        String result = null;
        CompanyTypeEntity $companyTypeEntity = companyTypeMapper.queryByName(companyTypeEntity.getName());
        if (null == $companyTypeEntity) {
            companyTypeEntity.setCreate_date(DateUtil.getCurDateTime());
            companyTypeEntity.setUpdate_date(DateUtil.getCurDateTime());
            save(companyTypeEntity);
        } else {
            result = "公司类型已经存在";
        }
        return AppUtil.returnObj(result);
    }

    @ServiceLog("修改公司类型")
    public AjaxResult updateCompanyType(CompanyTypeEntity companyTypeEntity) {
        String result = null;
        CompanyTypeEntity $companyTypeEntity =  companyTypeMapper.queryByName(companyTypeEntity.getName());
        if (null != $companyTypeEntity && $companyTypeEntity.getId() != $companyTypeEntity.getId()) {
            result = "公司类型不存在";
        } else {
            companyTypeEntity.setUpdate_date(DateUtil.getCurDateTime());
            updateByID(companyTypeEntity);
        }
        return AppUtil.returnObj(result);
    }

}
