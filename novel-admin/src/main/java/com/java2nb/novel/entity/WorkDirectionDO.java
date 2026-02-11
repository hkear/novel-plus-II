package com.java2nb.novel.entity;

import lombok.Data;
import java.util.Date;

@Data
public class WorkDirectionDO {
    private Long id;
    private String name;
    private String code;
    private Integer sort;
    private Integer status;
    private Date createTime;
    private Date updateTime;
}