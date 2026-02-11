package com.java2nb.novel.utils; // 包路径严格匹配文件目录：com/java2nb/novel/utils

import java.util.List;
import java.util.Map;

/**
 * 分页工具类
 */
public class PageUtils {
    // 总记录数
    private int total;
    // 列表数据
    private List<?> list;

    /**
     * 分页
     * @param list        列表数据
     * @param totalCount  总记录数
     */
    public PageUtils(List<?> list, int totalCount) {
        this.list = list;
        this.total = totalCount;
    }

    // getter/setter方法（必须有，否则编译失败）
    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<?> getList() {
        return list;
    }

    public void setList(List<?> list) {
        this.list = list;
    }
}