package com.yfvccm.mapper;
import com.yfvccm.domain.User;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserMapper{
    @Select("select * from user where user_account=#{account} AND user_password=#{password}")
    @Results(id = "userMap",value = {
            //id字段默认为false，表示不是主键
            //column表示数据库表字段，property表示实体类属性名。
            @Result(id = true,column = "user_id",property = "id"),
            @Result(column = "user_name",property = "name"),
            @Result(column = "user_password",property = "password"),
            @Result(column = "user_account",property = "account"),
    })
    User login(User user);

    @Select("select * from user where user_account=#{account}")
    @Results(id = "userMap1",value = {
            //id字段默认为false，表示不是主键
            //column表示数据库表字段，property表示实体类属性名。
            @Result(id = true,column = "user_id",property = "id"),
            @Result(column = "user_name",property = "name"),
            @Result(column = "user_password",property = "password"),
            @Result(column = "user_account",property = "account"),
    })
    User findByAccount(String account);

    @Update("update user set errortime=#{arg1} where user_account=#{arg0} ")
    void updateErrorTime(String accountError,int errorTime);

    @Update("update user set user_password=#{arg1} where user_id=#{arg0} ")
    void updatePassword(int userId,String password);
}
