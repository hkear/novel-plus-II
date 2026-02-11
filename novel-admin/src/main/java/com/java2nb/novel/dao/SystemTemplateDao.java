package com.java2nb.novel.dao;

import com.java2nb.novel.entity.SystemTemplateDO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;

@Mapper
public interface SystemTemplateDao {
    SystemTemplateDO selectById(Long id);
    SystemTemplateDO selectByCode(String code);
    List<SystemTemplateDO> selectList(Map<String, Object> params);
    int updateById(SystemTemplateDO record);
    int updateDefaultStatus(Map<String, Object> params);
}