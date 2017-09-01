package com.xe.demo.service;

import com.xe.demo.common.annotation.ServiceLog;
import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.utils.AppUtil;
import com.xe.demo.common.utils.DateUtil;
import com.xe.demo.mapper.CompanyMapper;
import com.xe.demo.model.AuthUser;
import com.xe.demo.model.CompanyEntity;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Rock on 2017/8/30.
 */
public class CompanyService extends AbstratService<CompanyEntity>  {

    @Autowired
    private CompanyMapper companyMapper;

    @ServiceLog("添加公司")
    public AjaxResult saveUser(CompanyEntity company) {
        String result = null;
        CompanyEntity $company = companyMapper.queryByName(company.getName());
        if (null == $company) {
            company.setCreateDate(DateUtil.getCurDateTime());
            save(company);
        } else {
            result = "公司已经存在";
        }
        return AppUtil.returnObj(result);
    }

}
