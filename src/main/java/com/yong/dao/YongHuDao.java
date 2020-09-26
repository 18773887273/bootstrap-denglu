package com.yong.dao;

import com.yong.vo.TongJi;
import com.yong.vo.YongHu;

import java.lang.reflect.MalformedParameterizedTypeException;
import java.util.List;
import java.util.Map;

public interface YongHuDao {
    public List<YongHu> alllist(YongHu yonghu);
    public int countall();
    public int delyonghu(int ids);
    public int addyonghu(YongHu yongHu);
    public YongHu getid(int yid);
    public  int updata(YongHu yonghu);
    //根据性别统计人数
    public List selectsex();
    public int selectnumber(String sex);
}
