package com.java2nb.novel.controller;

import com.java2nb.novel.entity.SystemSiteConfigDO;
import com.java2nb.novel.service.SystemSiteConfigService;
import com.java2nb.novel.service.SystemTemplateService;
// 修正：导入本地创建的工具类
import com.java2nb.novel.utils.R;
// 补全Controller注解导入
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/system/siteConfig")
public class SystemSiteConfigController {

    @Resource
    private SystemSiteConfigService systemSiteConfigService;
    @Resource
    private SystemTemplateService systemTemplateService;

    @GetMapping()
    public String edit(Model model) {
        SystemSiteConfigDO config = systemSiteConfigService.getCurrentConfig();
        List<?> templateList = systemTemplateService.list(null);
        model.addAttribute("config", config);
        model.addAttribute("templateList", templateList);
        return "system/siteConfig/edit";
    }

    @ResponseBody
    @PostMapping("/edit")
    public R edit(@RequestBody SystemSiteConfigDO config) {
        if (systemSiteConfigService.update(config) > 0) {
            return R.ok();
        }
        return R.error();
    }
}