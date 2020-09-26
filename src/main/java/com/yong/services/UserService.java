package com.yong.services;

import com.yong.vo.UserInfo;

import java.util.List;

public interface UserService {

    /**
     * 查询所有用户信息
     * @return
     */
    public List<UserInfo> queryalluser();
}
