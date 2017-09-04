package com.xe.demo.controller;

import com.xe.demo.common.annotation.Authority;
import com.xe.demo.common.annotation.ControllerLog;
import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.model.AuthRole;
import com.xe.demo.model.AuthUser;
import com.xe.demo.model.CompanyEntity;
import com.xe.demo.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by Rock on 2017/8/30.
 */
@Controller
@RequestMapping("/admin/company/")
public class CompanyController extends  BaseController {

    @Autowired
    private CompanyService companyService;

    @Authority(opCode="0401",opName="公司界面")
    @RequestMapping("mainPage")
    public String mainPage(Map<String, Object> map){
        List<CompanyEntity> list=companyService.queryAll();
        map.put("list", list);
        return "auth/company/main";
    }
    @ControllerLog("查询公司列表")
    @RequestMapping("queryPage")
    @ResponseBody
    @Authority(opCode = "0401", opName = "查询用户列表")
    public PageAjax<CompanyEntity> queryPage(PageAjax<CompanyEntity> page, CompanyEntity companyEntity) {
        return companyService.queryPage(page, companyEntity);
    }

    @Authority(opCode = "040101", opName = "添加公司页面")
    @RequestMapping("addPage")
    public String addPage(Map<String, Object> map) {
        return "auth/company/add";
    }



    @ControllerLog("添加公司")
    @RequestMapping("add")
    @ResponseBody
    @Authority(opCode = "040101", opName = "添加公司")
    public AjaxResult add(CompanyEntity companyEntity) {
        return companyService.saveCompany(companyEntity);
    }

}
