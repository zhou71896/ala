package com.xe.demo.mapper;

import com.xe.demo.common.dao.MyMapper;
import com.xe.demo.model.AuthUser;
import com.xe.demo.model.CompanyEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Rock on 2017/8/30.
 */
public interface CompanyMapper extends MyMapper<CompanyEntity>{

    CompanyEntity queryByName(@Param("name") String name);

    List<CompanyEntity> queryListByType(@Param("type")String type);

    List<CompanyEntity> queryList(@Param("company")CompanyEntity company);

}
