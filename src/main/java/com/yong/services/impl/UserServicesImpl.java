package com.yong.services.impl;

import com.yong.dao.UserDao;
import com.yong.services.UserServices;
import com.yong.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServicesImpl implements UserServices {
    @Autowired
    UserDao userDao;
    @Override
    public User getselect(User user) {
        return userDao.getselect(user);
    }
}
