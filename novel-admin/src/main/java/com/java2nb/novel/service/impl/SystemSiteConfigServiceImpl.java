package com.java2nb.novel.service.impl;

import com.java2nb.novel.dao.SystemSiteConfigDao;
import com.java2nb.novel.entity.SystemSiteConfigDO;
import com.java2nb.novel.service.SystemSiteConfigService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service
public class SystemSiteConfigServiceImpl implements SystemSiteConfigService {

    @Resource
    private SystemSiteConfigDao systemSiteConfigDao;

    @Override
    public SystemSiteConfigDO getById(Long id) {
        return systemSiteConfigDao.selectById(id);
    }

    @Override
    public int update(SystemSiteConfigDO config) {
        return systemSiteConfigDao.updateById(config);
    }

    @Override
    public SystemSiteConfigDO getCurrentConfig() {
        return getById(1L);
    }
}