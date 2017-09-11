package com.xe.demo.controller;

import com.xe.demo.common.annotation.Authority;
import com.xe.demo.common.annotation.ControllerLog;
import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.model.UserEntity;
import com.xe.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/ad/")
public class AdController extends BaseController{

    @Autowired
    private CustomerService customerService;

    ///页面
    @Authority(opCode = "0402",opName = "广告管理界面")
    @RequestMapping("adPage")
    public String customerPage(Map<String, Object> map){
        return "common/ad/ad_main_page";
    }

    @Authority(opCode = "040401",opName = "添加广告界面")
    @RequestMapping("addAdPage")
    public String addCustomerPage(Map<String, Object> map){
        return "common/ad/add_ad_page";
    }


    //操作

    @ControllerLog("查询广告列表")
    @RequestMapping("queryPage")
    @ResponseBody
    @Authority(opCode = "0302", opName = "查询广告列表")
    public PageAjax<UserEntity> queryPage(PageAjax<UserEntity> page, UserEntity user) {
        return customerService.queryPage(page, user);
    }

    @ControllerLog("添加广告")
    @RequestMapping("addAd")
    @ResponseBody
    @Authority(opCode = "030201", opName = "添加广告")
    public AjaxResult add(UserEntity user) {
        return customerService.addCustomer(user);
    }

}
