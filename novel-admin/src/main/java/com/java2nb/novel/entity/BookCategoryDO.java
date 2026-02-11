package com.java2nb.novel.entity;

import lombok.Data;
import java.util.Date;

@Data
public class BookCategoryDO {
    private Long id;
    private String name;
    private Long directionId;
    private Integer sort;
    private String customCss;
    private Date createTime;
    private Date updateTime;
}