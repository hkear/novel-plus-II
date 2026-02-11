package com.java2nb.novel.dao;

import com.java2nb.novel.entity.SystemSiteConfigDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemSiteConfigDao {
    SystemSiteConfigDO selectById(Long id);
    int updateById(SystemSiteConfigDO record);
}