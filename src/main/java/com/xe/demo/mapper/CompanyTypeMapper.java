package com.xe.demo.mapper;

import com.xe.demo.common.dao.MyMapper;
import com.xe.demo.model.CompanyEntity;
import com.xe.demo.model.CompanyTypeEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Rock on 2017/8/30.
 */
public interface CompanyTypeMapper extends MyMapper<CompanyTypeEntity>{

    CompanyTypeEntity queryByName(@Param("name") String name);

    List<CompanyTypeEntity> queryListByType(@Param("type") String type);

    List<CompanyTypeEntity> queryList(@Param("companytype") CompanyTypeEntity companytype);

}
