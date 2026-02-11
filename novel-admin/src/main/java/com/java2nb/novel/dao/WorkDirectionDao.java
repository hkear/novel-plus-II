package com.java2nb.novel.dao;

import com.java2nb.novel.entity.WorkDirectionDO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;

@Mapper
public interface WorkDirectionDao {
    WorkDirectionDO selectById(Long id);
    List<WorkDirectionDO> selectList(Map<String, Object> params);
    int count(Map<String, Object> params);
    int insert(WorkDirectionDO record);
    int updateById(WorkDirectionDO record);
    int deleteById(Long id);
}