package com.yong.services;

import com.yong.vo.PageVo;
import com.yong.vo.TongJi;
import com.yong.vo.YongHu;

import java.util.List;
import java.util.Map;

public interface YongHuServices {
    public List<YongHu> alllist(YongHu yonghu);
    public PageVo<YongHu> querycountcaigoubyCond(YongHu yonghu, int rows,int total);
    public int deloynghu(int ids);
    public int addyonghu(YongHu yongHu);
    public YongHu getid(int yid);
    public  int updata(YongHu yonghu);
    //根据性别统计人数
    public List selectsex();
    public int selectnumber(String sex);
}
