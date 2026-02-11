package com.java2nb.novel.entity;

import lombok.Data;

@Data
public class SystemTemplateDO {
    private Long id;
    private String name;
    private String code;
    private String customCss;
    private Integer isDefault;
    private Integer status;
    public void setId(Long id) {
        this.id = id;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }
}