package com.yong.services.impl;

import com.yong.dao.UserDao;
import com.yong.dao.UserDao2;
import com.yong.services.UserService;
import com.yong.vo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao2 userDao2;

    @Override
    public List<UserInfo> queryalluser() {
        return userDao2.queryalluser();
    }
}
