package com.java2nb.novel.service;

import com.java2nb.novel.entity.SystemSiteConfigDO;

public interface SystemSiteConfigService {
    SystemSiteConfigDO getById(Long id);
    int update(SystemSiteConfigDO config);
    SystemSiteConfigDO getCurrentConfig();
}