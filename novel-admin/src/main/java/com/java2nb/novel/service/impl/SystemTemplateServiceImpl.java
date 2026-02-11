package com.java2nb.novel.service.impl;

import com.java2nb.novel.dao.SystemTemplateDao;
import com.java2nb.novel.entity.SystemTemplateDO;
import com.java2nb.novel.service.SystemTemplateService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SystemTemplateServiceImpl implements SystemTemplateService {

    @Resource
    private SystemTemplateDao systemTemplateDao;

    @Override
    public SystemTemplateDO getById(Long id) {
        return systemTemplateDao.selectById(id);
    }

    @Override
    public SystemTemplateDO getByCode(String code) {
        return systemTemplateDao.selectByCode(code);
    }

    @Override
    public List<SystemTemplateDO> list(Map<String, Object> params) {
        return systemTemplateDao.selectList(params);
    }

    @Override
    public int update(SystemTemplateDO template) {
        return systemTemplateDao.updateById(template);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int setDefault(Long id) {
        // 取消原有默认
        Map<String, Object> params = new HashMap<>();
        params.put("isDefault", 0);
        systemTemplateDao.updateDefaultStatus(params);
        // 设置新默认
        SystemTemplateDO template = new SystemTemplateDO();
        template.setId(id);
        template.setIsDefault(1);
        return systemTemplateDao.updateById(template);
    }
}