package cn.com.zj.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import cn.com.zj.pojo.Bookadmin;
import cn.com.zj.service.AdminService;




@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	

	//管理员登录
	@RequestMapping("/adminLogin.action")
	public ModelAndView adminLogin(String username,String password,HttpSession httpSession){
		Bookadmin Bookadmin1 = adminService.adminLogin(username, password, httpSession);
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.addObject("username", username);
		if(Bookadmin1 != null ){			
			httpSession.setAttribute("username", username);			
			aModelAndView.setViewName("AdminView.jsp");
			return aModelAndView;
		}else{
			aModelAndView.addObject("wrongMessage","<font size = '2' color = 'red'>用户名或密码错误</font>");
			aModelAndView.setViewName("AdminLogin.jsp");
			return aModelAndView;
		}
	}
	
	
	
	//查询全部管理员
	
	@RequestMapping("/selectAllAdmin.action")
	public ModelAndView selectAllBooks(){
		List<Bookadmin> list = adminService.selectAllBooks();
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.addObject("list", list);
		aModelAndView.setViewName("AllAdmin.jsp");
		return aModelAndView;
		
	}
	

	//添加用户
	
	@RequestMapping("/addAdmin.action")
	public ModelAndView addUser(String AdminUname,String AdminPwd){
		int a = adminService.addUser(AdminUname, AdminPwd);
		ModelAndView aModelAndView = new ModelAndView();
		if(a >= 0 ){
			aModelAndView.setViewName("index.jsp");
			return aModelAndView;
		}else{
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
	}
	
	
}
