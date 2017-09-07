package com.xe.demo.controller;

import com.xe.demo.common.annotation.Authority;
import com.xe.demo.common.annotation.ControllerLog;
import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.model.AuthUser;
import com.xe.demo.model.CompanyEntity;
import com.xe.demo.model.CompanyTypeEntity;
import com.xe.demo.service.CompanyTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by Rock on 2017/9/5.
 */
@Controller
@RequestMapping("/admin/company/")
public class CompanyTypeController extends  BaseController {

    @Autowired
    private CompanyTypeService companyTypeService;

    @Authority(opCode="0402",opName="公司类型页面")
    @RequestMapping("mainTypePage")
    public String mainTypePage(Map<String, Object> map){
        List<CompanyTypeEntity> list=companyTypeService.queryAll();
        map.put("list", list);
        return "auth/company/company_type";
    }
    @ControllerLog("查询公司列表")
    @RequestMapping("queryTypePage")
    @ResponseBody
    @Authority(opCode = "0402", opName = "查询公司类型列表")
    public PageAjax<CompanyTypeEntity> queryTypePage(PageAjax<CompanyTypeEntity> page, CompanyTypeEntity companyTypeEntity) {
        return companyTypeService.queryPage(page, companyTypeEntity);
    }

    @Authority(opCode = "040201", opName = "添加公司类型页面")
    @RequestMapping("addTypePage")
    public String addTypePage(Map<String, Object> map) {
        return "auth/company/add_type";
    }

    @Authority(opCode = "040202", opName = "修改公司类型页面")
    @RequestMapping("updateTypePage/{id}")
    public String updateTypePage(@PathVariable("id") int id,Map<String, Object> map) {
        CompanyTypeEntity companyTypeEntity=companyTypeService.queryByID(id);
        map.put("companyTypeEntity",companyTypeEntity);
        return "auth/company/update_type";
    }

    @ControllerLog("添加公司类型")
    @RequestMapping("addCompanyType")
    @ResponseBody
    @Authority(opCode = "040201", opName = "添加公司")
    public AjaxResult addCompanyType(CompanyTypeEntity companyTypeEntity) {
        return companyTypeService.saveCompanyType(companyTypeEntity);
    }

    @ControllerLog("修改公司类型")
    @RequestMapping("updateCompanyType")
    @ResponseBody
    @Authority(opCode = "040202", opName = "修改公司类型")
    public AjaxResult updateCompanyType(CompanyTypeEntity companyTypeEntity) {
        return companyTypeService.updateCompanyType(companyTypeEntity);
    }

    @ControllerLog("删除公司类型")
    @RequestMapping("deleteTypeByID/{id}")
    @ResponseBody
    @Authority(opCode = "040104", opName = "删除")
    public AjaxResult deleteTypeByID(@PathVariable("id") int id) {
        return companyTypeService.deleteByID(id);
    }


}


