package com.xe.demo.service;

import com.github.pagehelper.page.PageMethod;
import com.xe.demo.common.annotation.ServiceLog;
import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.common.utils.AppUtil;
import com.xe.demo.common.utils.DateUtil;
import com.xe.demo.mapper.CustomerMapper;
import com.xe.demo.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService extends  AbstratService<UserEntity> {

    @Autowired
    private CustomerMapper customerMapper;


    @ServiceLog("查询用户列表")
    @Override
    public PageAjax<UserEntity> queryPage(PageAjax<UserEntity> page, UserEntity entity) {
        PageMethod.startPage(page.getPageNo(), page.getPageSize());
        List<UserEntity> list=customerMapper.queryList(entity);
        return AppUtil.returnPage(list);
    }


    @ServiceLog("添加用户")
    public AjaxResult addCustomer(UserEntity entity) {
        String result = null;
        UserEntity $user = customerMapper.queryByUserName(entity.getNick_name());
        if (null == $user) {
            entity.setRegiste_time(DateUtil.getCurDateTime());
            save(entity);
        } else {
            result = "用户名已存在";
        }
        return AppUtil.returnObj(result);
    }

    @ServiceLog("通过昵称查询用户")
    public List<UserEntity> queryUserByNickName(String nickName) {
        UserEntity userEntity=new UserEntity();
        userEntity.setNick_name(nickName);
        return customerMapper.select(userEntity);
    }
}
