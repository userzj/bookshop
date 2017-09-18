package cn.com.zj.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import cn.com.zj.mapper.BookadminMapper;
import cn.com.zj.pojo.Bookadmin;

public class AdminService {
	@Autowired
	BookadminMapper bookadminMapper;
	
	public Bookadmin adminLogin(String username,String password,HttpSession httpSession){
		Bookadmin aBookadmin  = new Bookadmin();
		aBookadmin.setAdminuname(username);
		aBookadmin.setAdminpwd(password);
		Bookadmin Bookadmin1 = 	bookadminMapper.AdminLoginSelect(aBookadmin);
		return Bookadmin1;
		
	}
	public List<Bookadmin> selectAllBooks(){
		List<Bookadmin> list = bookadminMapper.selectAllAdmin();
		return list;
	}
	public int addUser(String AdminUname,String AdminPwd){
		Bookadmin aBookadmin = new Bookadmin();
		aBookadmin.setAdminpwd(AdminPwd);
		aBookadmin.setAdminuname(AdminUname);
		int a = bookadminMapper.insert(aBookadmin);
		return a;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
