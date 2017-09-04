package com.xe.demo.service;

import com.github.pagehelper.page.PageMethod;
import com.xe.demo.common.annotation.ServiceLog;
import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.common.utils.AppUtil;
import com.xe.demo.common.utils.DateUtil;
import com.xe.demo.mapper.CompanyMapper;
import com.xe.demo.model.AuthUser;
import com.xe.demo.model.CompanyEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Rock on 2017/8/30.
 */
@Service
public class CompanyService extends AbstratService<CompanyEntity>  {

    @Autowired
    private CompanyMapper companyMapper;

    @Override
    @ServiceLog("查询公司列表")
    public PageAjax<CompanyEntity> queryPage(PageAjax<CompanyEntity> page, CompanyEntity companyEntity) {
        PageMethod.startPage(page.getPageNo(), page.getPageSize());
        List<CompanyEntity> list = companyMapper.queryList(companyEntity);
        return AppUtil.returnPage(list);
    }

    @ServiceLog("添加公司")
    public AjaxResult saveCompany(CompanyEntity company) {
        String result = null;
        CompanyEntity $company = companyMapper.queryByName(company.getName());
        if (null == $company) {
            company.setCreate_date(DateUtil.getCurDateTime());
            company.setUpdate_date(DateUtil.getCurDateTime());
            save(company);
        } else {
            result = "公司已存在";
        }
        return AppUtil.returnObj(result);
    }

    @ServiceLog("查询公司列表")
    public List<CompanyEntity> queryCompaniesByType(Byte type) {
        CompanyEntity companyEntity = new CompanyEntity();
        companyEntity.setType(type);
        return companyMapper.select(companyEntity);
    }

}
