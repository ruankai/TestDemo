package com.yfvccm.service;
import com.yfvccm.domain.User;
/**
 *用户接口
 */
public interface UserService{
    //通过User的用户账号和用户密码查询用户信息
    User login(User user);
    //通过账户查询用户信息
    User findByAccount(String account);
    void updateErrorTime(String accountError,int errorTime);
    void updatePassword(int userId,String password);
}
