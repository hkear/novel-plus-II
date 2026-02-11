package com.java2nb.novel.service.impl;

import com.java2nb.novel.dao.WorkDirectionDao;
import com.java2nb.novel.entity.WorkDirectionDO;
import com.java2nb.novel.service.WorkDirectionService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class WorkDirectionServiceImpl implements WorkDirectionService {

    @Resource
    private WorkDirectionDao workDirectionDao;

    @Override
    public WorkDirectionDO getById(Long id) {
        return workDirectionDao.selectById(id);
    }

    @Override
    public List<WorkDirectionDO> list(Map<String, Object> params) {
        return workDirectionDao.selectList(params);
    }

    @Override
    public int count(Map<String, Object> params) {
        return workDirectionDao.count(params);
    }

    @Override
    public int save(WorkDirectionDO direction) {
        return workDirectionDao.insert(direction);
    }

    @Override
    public int update(WorkDirectionDO direction) {
        return workDirectionDao.updateById(direction);
    }

    @Override
    public int delete(Long id) {
        return workDirectionDao.deleteById(id);
    }
}