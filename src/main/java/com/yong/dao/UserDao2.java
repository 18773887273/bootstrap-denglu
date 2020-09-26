package com.yong.dao;

import com.yong.vo.UserInfo;

import java.util.List;

public interface UserDao2 {

    /**
     * 查询所有用户信息
     * @return
     */
    public List<UserInfo> queryalluser();
}
