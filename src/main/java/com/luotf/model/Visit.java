package com.luotf.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Visit {
	
    private Integer id;
    
    private String ip;

    private String url;
    
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date time;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}