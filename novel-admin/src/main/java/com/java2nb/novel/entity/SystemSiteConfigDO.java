package com.java2nb.novel.entity;

import lombok.Data;

@Data
public class SystemSiteConfigDO {
    private Long id;
    private String siteTitle;
    private String faviconUrl;
    private String logoUrl;
    private String templateCode;
}