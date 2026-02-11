package com.java2nb.novel.controller;

import com.java2nb.novel.entity.BookCategoryDO;
import com.java2nb.novel.service.BookCategoryService;
import com.java2nb.novel.service.WorkDirectionService;
// 修正：导入本地创建的工具类
import com.java2nb.novel.utils.PageUtils;
import com.java2nb.novel.utils.R;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/novel/bookCategory")
public class BookCategoryController {

    @Resource
    private BookCategoryService bookCategoryService;
    @Resource
    private WorkDirectionService workDirectionService;

    @GetMapping()
    public String list() {
        return "novel/bookCategory/list";
    }

    @ResponseBody
    @GetMapping("/list")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        List<BookCategoryDO> list = bookCategoryService.list(params);
        int total = bookCategoryService.count(params);
        return new PageUtils(list, total);
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("directionList", workDirectionService.list(null));
        return "novel/bookCategory/add";
    }

    @ResponseBody
    @PostMapping("/add")
    public R add(@RequestBody BookCategoryDO bookCategory) {
        if (bookCategoryService.save(bookCategory) > 0) {
            return R.ok();
        }
        return R.error();
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        BookCategoryDO category = bookCategoryService.getById(id);
        model.addAttribute("category", category);
        model.addAttribute("directionList", workDirectionService.list(null));
        return "novel/bookCategory/edit";
    }

    @ResponseBody
    @PostMapping("/edit")
    public R edit(@RequestBody BookCategoryDO bookCategory) {
        if (bookCategoryService.update(bookCategory) > 0) {
            return R.ok();
        }
        return R.error();
    }

    @ResponseBody
    @PostMapping("/remove")
    public R remove(Long id) {
        if (bookCategoryService.delete(id) > 0) {
            return R.ok();
        }
        return R.error();
    }

    @ResponseBody
    @PostMapping("/batchRemove")
    public R batchRemove(@RequestParam("ids[]") Long[] ids) {
        if (bookCategoryService.deleteBatch(ids) > 0) {
            return R.ok();
        }
        return R.error();
    }
}