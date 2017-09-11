package com.xe.demo.controller;

import java.util.Map;
import com.xe.demo.common.annotation.Authority;
import com.xe.demo.common.annotation.ControllerLog;
import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.model.AuthUser;
import com.xe.demo.model.UserEntity;
import com.xe.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/")
public class CustomerController extends BaseController{

    @Autowired
    private CustomerService customerService;

    ///页面
    @Authority(opCode = "0302",opName = "顾客管理界面")
    @RequestMapping("customerPage")
    public String customerPage(Map<String, Object> map){
        return "common/user/customer_page";
    }

    @Authority(opCode = "030201",opName = "添加顾客界面")
    @RequestMapping("addCustomerPage")
    public String addCustomerPage(Map<String, Object> map){
        return "common/user/add_customer_page";
    }


    //操作

    @ControllerLog("查询顾客列表")
    @RequestMapping("queryPage")
    @ResponseBody
    @Authority(opCode = "0302", opName = "查询顾客列表")
    public PageAjax<UserEntity> queryPage(PageAjax<UserEntity> page, UserEntity user) {
        return customerService.queryPage(page, user);
    }

    @ControllerLog("添加顾客")
    @RequestMapping("addCustomer")
    @ResponseBody
    @Authority(opCode = "030201", opName = "添加用户")
    public AjaxResult add(UserEntity user) {
        return customerService.addCustomer(user);
    }

}
