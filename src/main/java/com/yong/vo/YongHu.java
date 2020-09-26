package com.yong.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class YongHu {
    private  Integer yid;
    private String yonghuname;
    private  String sex;
    @JsonFormat(pattern = "yyyy-MM-dd" ,timezone="GMT+8")
    @JSONField(format = "yyyy-MM-dd" )
    private Date birthday;
    private String phone;

    public YongHu(Integer yid, String yonghuname, String sex, Date birthday, String phone) {
        this.yid = yid;
        this.yonghuname = yonghuname;
        this.sex = sex;
        this.birthday = birthday;
        this.phone = phone;
    }
    public  YongHu(){}

    @Override
    public String toString() {
        return "YongHu{" +
                "yid=" + yid +
                ", yonghuname='" + yonghuname + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday=" + birthday +
                ", phone='" + phone + '\'' +
                '}';
    }

    public Integer getYid() {
        return yid;
    }

    public void setYid(Integer yid) {
        this.yid = yid;
    }

    public String getYonghuname() {
        return yonghuname;
    }

    public void setYonghuname(String yonghuname) {
        this.yonghuname = yonghuname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
