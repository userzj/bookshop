package cn.com.zj.service;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import cn.com.zj.mapper.UserMapper;
import cn.com.zj.pojo.User;

public class UserService {
	@Autowired
	UserMapper userMapper;
	
	public int addUser(String username,String password){
		User user  = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		int a = userMapper.insertSelective(user);
		return a;
	}
	public int addUserDetail(Integer id,String sex,String address,String phone,String post,String email){
		User user = userMapper.selectByPrimaryKey(id);
		user.setAddress(address);
		user.setEmail(email);
		user.setLevel(0);
		user.setPhone(phone);
		  Format format = new SimpleDateFormat("yyyyMMdd");
		user.setPost(post);
		user.setRetime(format.format(new Date()));
		user.setSex(sex);
		int a = userMapper.updateByPrimaryKeySelective(user);
		return a;
	}
	public List<User> selectAllBooks(){
		List<User> list =  userMapper.selectAllUsers();
		return list;
	}
	public User userLogin(String username , String password){
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		User user1 = userMapper.userLogin(user);
		return user1;

	}
	public User userRegisiter(String username){
		User user = new User();
		user.setUsername(username);
		User user1 = userMapper.userRegisiter(user);
		return user1;

	}
	public int userRegisiter1(String username ,String password){
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		int a = userMapper.userRegisiter1(user);
		return a;
	}
	public User selectByPrimaryKey(Integer id ){
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}
	public int updateLevel(Integer id ){
		int a = userMapper.updateLevel(id);
		return a;
	}
	public User queryUserInfo(Integer id){
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}
	
	
	
	
	
	
	
	
}
