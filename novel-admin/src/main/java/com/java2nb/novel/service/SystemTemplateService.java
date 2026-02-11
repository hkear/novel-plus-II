package com.java2nb.novel.service;

import com.java2nb.novel.entity.SystemTemplateDO;
import java.util.List;
import java.util.Map;

public interface SystemTemplateService {
    SystemTemplateDO getById(Long id);
    SystemTemplateDO getByCode(String code);
    List<SystemTemplateDO> list(Map<String, Object> params);
    int update(SystemTemplateDO template);
    int setDefault(Long id);
}