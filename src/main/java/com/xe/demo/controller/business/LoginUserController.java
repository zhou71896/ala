package com.xe.demo.controller.business;

import com.sun.org.glassfish.external.statistics.annotations.Reset;
import com.xe.demo.controller.BaseController;
import com.xe.demo.mapper.CustomerMapper;
import com.xe.demo.model.UserEntity;
import com.xe.demo.service.CustomerService;
import com.xe.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by Rock on 2017/9/11.
 */
@RestController
@RequestMapping("/user/login")
public class LoginUserController extends BaseController {


    @Autowired
    private CustomerService customerService;

    @RequestMapping("json")
    public List<UserEntity> resp(){
           return  customerService.queryAll();
    }
}
