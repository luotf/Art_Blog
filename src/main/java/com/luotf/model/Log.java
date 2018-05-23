package com.luotf.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Log implements Serializable{
    
    
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String userType;
    
    private String ip;

    private String description;

    private String param;
    
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date addtime;

   
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

    public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getDescription() {
        return description;
    }

    
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

   
    public String getParam() {
		return param;
	}


	public void setParam(String param) {
		this.param = param;
	}


	public Date getAddtime() {
        return addtime;
    }

   
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}