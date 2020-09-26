package com.yong.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.yong.services.YongHuServices;
import com.yong.vo.PageVo;
import com.yong.vo.TongJi;
import com.yong.vo.YongHu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class YongHuController {
    @Autowired
    YongHuServices yongHuServices;
    @RequestMapping("/yonghu.action")
    @ResponseBody
    //我们要返回两个值： rows     total
    //
    //rows:我们查询到的数据　　
    //
    //total:数据总数
    public PageVo<YongHu> queryPersonbyCond2(YongHu yonghu,
                                                 @RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber,
                                                 @RequestParam(value = "pageSize", defaultValue = "5") int pageSize) {
        return yongHuServices.querycountcaigoubyCond(yonghu, pageNumber,pageSize);
    }
    @RequestMapping("/delyonghu.action")
    @ResponseBody
    public  int delyonghu(int ids){
        System.out.println(ids);
            int num =yongHuServices.deloynghu(ids);
        return num;
    }
    @RequestMapping("/addyonghu.action")
    @ResponseBody
    public  int addyonghu(YongHu yongHu){
        int num =yongHuServices.addyonghu(yongHu);
        return num;
    }


    @RequestMapping("/Updatayonghu.action")
    @ResponseBody
    public  int updatayonghu(YongHu yongHu){
        int num =yongHuServices.updata(yongHu);
        return num;
    }
    @RequestMapping("/getid.action")
    @ResponseBody
    public  YongHu getid(int yid){
        YongHu yongHu =yongHuServices.getid(yid);
        return yongHu;
    }
    @RequestMapping("/getsex.action")
    @ResponseBody
    public List<TongJi> getid(){
        List<String> list=yongHuServices.selectsex();
        List<TongJi> list1=new ArrayList<TongJi>();

        for(int i=0;i<list.size();i++){
            int countSex =yongHuServices.selectnumber(list.get(i));
            TongJi tongJi = new TongJi(countSex,list.get(i));
            list1.add(tongJi);
        }
        return list1;
    }
}
