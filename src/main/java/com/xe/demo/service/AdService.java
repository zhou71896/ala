package com.xe.demo.service;

import com.github.pagehelper.page.PageMethod;
import com.xe.demo.common.annotation.ServiceLog;
import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.common.utils.AppUtil;
import com.xe.demo.common.utils.DateUtil;
import com.xe.demo.mapper.AdMapper;
import com.xe.demo.mapper.CustomerMapper;
import com.xe.demo.model.AdEntity;
import com.xe.demo.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdService extends  AbstratService<AdEntity> {

    @Autowired
    private AdMapper adMapper;


    @ServiceLog("查询广告列表")
    @Override
    public PageAjax<AdEntity> queryPage(PageAjax<AdEntity> page, AdEntity entity) {
        PageMethod.startPage(page.getPageNo(), page.getPageSize());
        List<AdEntity> list=adMapper.queryList(entity);
        return AppUtil.returnPage(list);
    }


    @ServiceLog("添加广告")
    public AjaxResult addAd(AdEntity entity) {
        String result = null;
        AdEntity $ad = adMapper.queryByUserName(entity.getName());
        if (null == $ad) {
            entity.setCreate_date(DateUtil.getCurDateTime());
            entity.setUpdateDate(DateUtil.getCurDateTime());
            save(entity);
        } else {
            result = "广告已存在";
        }
        return AppUtil.returnObj(result);
    }

    @ServiceLog("通过名称查询广告")
    public List<AdEntity> queryAdByName(String name) {
        AdEntity adEntity=new AdEntity();
        adEntity.setName(name);
        return adMapper.select(adEntity);
    }
}
