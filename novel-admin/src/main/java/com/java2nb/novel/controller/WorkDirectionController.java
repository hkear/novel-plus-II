package com.java2nb.novel.controller;

import com.java2nb.novel.entity.WorkDirectionDO;
import com.java2nb.novel.service.WorkDirectionService;
// 修正：导入本地创建的工具类
import com.java2nb.novel.utils.PageUtils;
import com.java2nb.novel.utils.R;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/system/workDirection")
public class WorkDirectionController {

    @Resource
    private WorkDirectionService workDirectionService;

    @GetMapping()
    public String list() {
        return "system/workDirection/list";
    }

    @ResponseBody
    @GetMapping("/list")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        List<WorkDirectionDO> list = workDirectionService.list(params);
        int total = workDirectionService.count(params);
        return new PageUtils(list, total);
    }

    @GetMapping("/add")
    public String add() {
        return "system/workDirection/add";
    }

    @ResponseBody
    @PostMapping("/add")
    public R add(@RequestBody WorkDirectionDO workDirection) {
        if (workDirectionService.save(workDirection) > 0) {
            return R.ok();
        }
        return R.error();
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        WorkDirectionDO direction = workDirectionService.getById(id);
        model.addAttribute("direction", direction);
        return "system/workDirection/edit";
    }

    @ResponseBody
    @PostMapping("/edit")
    public R edit(@RequestBody WorkDirectionDO workDirection) {
        if (workDirectionService.update(workDirection) > 0) {
            return R.ok();
        }
        return R.error();
    }

    @ResponseBody
    @PostMapping("/remove")
    public R remove(Long id) {
        if (workDirectionService.delete(id) > 0) {
            return R.ok();
        }
        return R.error();
    }
}