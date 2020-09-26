package com.yong.vo;

public class User {
    private  Integer uid;
    private  String username;
    private  String userpass;

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", userpass='" + userpass + '\'' +
                '}';
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass;
    }

    public User(Integer uid, String username, String userpass) {
        this.uid = uid;
        this.username = username;
        this.userpass = userpass;
    }
    public  User(){}
}
