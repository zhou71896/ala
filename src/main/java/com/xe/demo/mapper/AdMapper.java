package com.xe.demo.mapper;

import com.xe.demo.common.dao.MyMapper;
import com.xe.demo.model.AdEntity;
import com.xe.demo.model.UserEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdMapper extends MyMapper<AdEntity> {
    AdEntity queryByUserName(@Param("name") String name);

    List<AdEntity> queryList(@Param("ad") AdEntity ad);

}
