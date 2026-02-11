package com.java2nb.novel.service;

import com.java2nb.novel.entity.WorkDirectionDO;
import java.util.List;
import java.util.Map;

public interface WorkDirectionService {
    WorkDirectionDO getById(Long id);
    List<WorkDirectionDO> list(Map<String, Object> params);
    int count(Map<String, Object> params);
    int save(WorkDirectionDO direction);
    int update(WorkDirectionDO direction);
    int delete(Long id);
}