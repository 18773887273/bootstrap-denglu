package com.yong.controller;

import com.yong.services.UserServices;
import com.yong.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
    @Autowired
   UserServices userServices;
    @RequestMapping(value ="/denglu.action",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public  int denglu(String username, String userpass){
        System.out.println(username);
        System.out.println(userpass);
        User user=new User(null,username,userpass);
     User user1=userServices.getselect(user);
     if(user1!=null){
         return  1;
     }
     return 0;
    }
}
