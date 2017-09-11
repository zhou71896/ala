package com.xe.demo.mapper;

import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
import com.xe.demo.common.dao.MyMapper;
import com.xe.demo.model.AuthUser;
import com.xe.demo.model.UserEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerMapper extends MyMapper<UserEntity> {
    UserEntity queryByUserName(@Param("nick_name") String nickName);

    List<UserEntity> queryList(@Param("user")UserEntity user);

}
