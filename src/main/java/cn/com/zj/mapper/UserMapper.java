package cn.com.zj.mapper;

import java.util.List;

import cn.com.zj.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> selectAllUsers();
    
    User userLogin(User record);
    
    User userRegisiter(User record);
    
    int  userRegisiter1(User record);
    
    int updateLevel(Integer id );
}