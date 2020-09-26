package com.yong.services.impl;

import com.github.pagehelper.PageHelper;
import com.yong.dao.YongHuDao;
import com.yong.services.YongHuServices;
import com.yong.vo.PageVo;
import com.yong.vo.TongJi;
import com.yong.vo.YongHu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class YongHuServicesImpl implements YongHuServices {
    @Autowired
    YongHuDao yongHuDao;
    @Override
    public List<YongHu> alllist(YongHu yonghu) {
        return yongHuDao.alllist(yonghu);
    }

    @Override
    public PageVo<YongHu> querycountcaigoubyCond(YongHu yonghu,int rows,int total) {
        PageVo<YongHu> pageVo = new PageVo<>();

        //在需要分页的代码调用前 执行以下代码
        PageHelper.startPage(rows,total);
        //获取分页后 显示的数据集合
        pageVo.setRows(yongHuDao.alllist(yonghu));
        //获取总的记录数量
        pageVo.setTotal(yongHuDao.countall());

        return pageVo;
    }

    @Override
    public int deloynghu(int ids) {
        return yongHuDao.delyonghu(ids);
    }

    @Override
    public int addyonghu(YongHu yongHu) {
        return yongHuDao.addyonghu(yongHu);
    }

    @Override
    public YongHu getid(int yid) {
        return yongHuDao.getid(yid);
    }

    @Override
    public int updata(YongHu yonghu) {
        return yongHuDao.updata(yonghu);
    }

    @Override
    public List selectsex() {
       /* Map<String,Integer> map=new HashMap<String, Integer>();
        int [] arr=yongHuDao.selectsex();
        for(int i=0;i<arr.length;i++){

        }*/
        return yongHuDao.selectsex();
    }

    @Override
    public int selectnumber(String sex) {
        return yongHuDao.selectnumber(sex);
    }
}
