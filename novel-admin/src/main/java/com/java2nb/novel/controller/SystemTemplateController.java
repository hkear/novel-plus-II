package com.java2nb.novel.controller;

import com.java2nb.novel.entity.SystemTemplateDO;
import com.java2nb.novel.service.SystemTemplateService;
// 修正：导入本地创建的工具类
import com.java2nb.novel.utils.R;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/system/templateConfig")
public class SystemTemplateController {

    @Resource
    private SystemTemplateService systemTemplateService;

    @GetMapping()
    public String list(Model model) {
        List<SystemTemplateDO> list = systemTemplateService.list(null);
        model.addAttribute("templateList", list);
        return "system/templateConfig/list";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        SystemTemplateDO template = systemTemplateService.getById(id);
        model.addAttribute("template", template);
        return "system/templateConfig/edit";
    }

    @ResponseBody
    @PostMapping("/edit")
    public R edit(@RequestBody SystemTemplateDO template) {
        if (systemTemplateService.update(template) > 0) {
            return R.ok();
        }
        return R.error();
    }

    @ResponseBody
    @PostMapping("/setDefault")
    public R setDefault(Long id) {
        if (systemTemplateService.setDefault(id) > 0) {
            return R.ok();
        }
        return R.error();
    }
}