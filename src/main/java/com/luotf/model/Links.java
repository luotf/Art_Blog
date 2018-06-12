package com.luotf.model;

import java.io.Serializable;
import java.util.Date;

public class Links implements Serializable{
    
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String link;
    
    private String name;

    private Integer clicknum;
    
    private Integer sort;
    
    private Integer status;
    
    private Date addtime;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getClicknum() {
        return clicknum;
    }
    
    public void setClicknum(Integer clicknum) {
        this.clicknum = clicknum;
    }

    public Integer getSort() {
        return sort;
    }
    
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    
    public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getAddtime() {
        return addtime;
    }
    
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}