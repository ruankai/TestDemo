package com.yfvccm.service.impl;
import com.yfvccm.domain.User;
import com.yfvccm.mapper.UserMapper;
import com.yfvccm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 *用户接口实现类
 */
@Service
public class UserServiceImpl  implements UserService {
    //注入userMapper
    @Autowired
    private UserMapper userMapper;
    //通过User的用户账号和用户密码查询用户信息
    @Override
    public User login(User user) {
        return userMapper.login(user);
    }

    public User findByAccount(String account){
       return userMapper.findByAccount(account);
    };

    public void updateErrorTime(String accountError,int errorTime){
         userMapper.updateErrorTime(accountError,errorTime);
    };

    public void updatePassword(int userId,String password){
        userMapper.updatePassword(userId,password);
    };

}
