package com.yfvccm.domain;
import java.io.Serializable;
public class User implements Serializable {
    private Integer id;       //用户id
    private String name;      //用户中文名称
    private String password;  //用户密码
    private String account;     //用户账号）
    private int errortime;   //登录错误次数

    public int getErrortime() {
        return errortime;
    }
    public void setErrortime(int errortime) {
        this.errortime = errortime;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getAccount() {
        return account;
    }
    public void setAccount(String account) {
        this.account = account;
    }
}
