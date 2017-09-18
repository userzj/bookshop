package cn.com.zj.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import cn.com.zj.pojo.User;
import cn.com.zj.service.OrderService;
import cn.com.zj.service.UserService;

@Controller
@SessionAttributes("userlogin")
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	OrderService orderService;
	

	//添加用户
	@RequestMapping("/addUser.action")
	public ModelAndView addUser(String username,String password){
		int a = userService.addUser(username, password);
		ModelAndView aModelAndView = new ModelAndView();
		if(a >= 0 ){
			User user = new User();
			user.setPassword(password);
			user.setUsername(username);
			aModelAndView.addObject("userlogin",user);
			aModelAndView.setViewName("index.jsp");
			return aModelAndView;
		}else{
			
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
	}
	
	//添加用户详细信息
	@RequestMapping("/addUserDetail.action")
	public ModelAndView addUserDetail(Integer id,String sex,String address,String phone,String post,String email){
		int a =userService.addUserDetail(id, sex, address, phone, post, email);
		ModelAndView aModelAndView = new ModelAndView();
		if(a >= 0 ){
			
			
			aModelAndView.setViewName("index.jsp");
			return aModelAndView;
		}else{
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
	}
	
	//查询全部用户
	@RequestMapping("/selectAllUsers.action")
	public ModelAndView selectAllBooks(){
		List<User> list =  userService.selectAllBooks();
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.addObject("list", list);
		aModelAndView.setViewName("AllUsers.jsp");
		return aModelAndView;
		
	}
	//用户登录验证
	@RequestMapping("/userLogin.action")
	public ModelAndView userLogin(String username ,String password){
		ModelAndView aModelAndView = new ModelAndView();
		User user = userService.userLogin(username, password);
		
		if(user == null){
			aModelAndView.addObject("wrongMessage","<font size = '2' color = 'red'>用户名或密码错误</font>");
			aModelAndView.setViewName("login.jsp");
			
			return aModelAndView;
		}else{
			aModelAndView.addObject("userlogin",user);
			aModelAndView.setViewName("index.jsp");
			return aModelAndView;
		}
	
		
	}
		//AJAX验证注册用户名
	@RequestMapping("/userRegisiter1.action")
	public void userRegisiter(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html");
		//设置请求编码方式
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		User user = userService.userRegisiter(username);
		//设置响应头信息
		response.setHeader("content-type","text/html; charset=utf-8");
		//响应输出
		PrintWriter out = response.getWriter();
		if(user != null ){
			out.print("<font color='red'>用户名已存在</font>");
		}else{
			out.print("<font color='green'>用户名可用</font>");
		}
		//推送
		out.flush();
		//关闭
		out.close();
		
	}
	//用户注册2
	@RequestMapping("/userRegisiter2.action")
	public ModelAndView userRegisiter2(String username ,String password){
		ModelAndView aModelAndView = new ModelAndView();
		int a = userService.userRegisiter1(username, password);
		User user = new User();
		user.setPassword(password);
		user.setUsername(username);
		
		if(a > 0){
			
			aModelAndView.setViewName("index.jsp");
			return aModelAndView;
		}else{
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
	
		
	}
	//确认收货验证密码
	@RequestMapping("/isReceive.action")
	public ModelAndView isReceive(User user,HttpSession session,Integer orderid){
		ModelAndView mav = new ModelAndView();
		user.setId(((User)session.getAttribute("userlogin")).getId());
		User u =userService.userLogin(user.getUsername(), user.getPassword());
		if( u != null){		
			 orderService.isReceive(orderid);
			mav.setViewName("index.jsp");
		}else{
			mav.addObject("wrongMessage","<font size = '2' color = 'red'>密码错误</font>");
			mav.setViewName("/404error.jsp");
		}
		return mav;
	}
	//用户页面-AJAX修改前查询验证密码
	@RequestMapping("/queryforupdateuser.action")
	public void queryforupdateuser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		User user = new User();
		user.setId(Integer.parseInt(request.getParameter("id")));
		user.setPassword(request.getParameter("password"));
		User u = userService.userLogin(user.getUsername(), user.getPassword());
		if(u == null){
		out.print(0);
		}else{
		out.print(1);
		}
		response.setHeader("Content-Type","text/html; charset=utf-8");
		out.flush();
		out.close();
	}
	//升级为会员
	@RequestMapping("/updatevip.action")
	public ModelAndView updatevip(Integer id){
		ModelAndView mav = new ModelAndView();		
		userService.updateLevel(id);
		mav.setViewName("index.jsp");
		return mav;
	}
	//查询用户详细信息
	@RequestMapping("/queryUserInfo.action")
	public ModelAndView queryUserInfo(Integer id){
		ModelAndView aModelAndView = new ModelAndView();	
		User user = userService.queryUserInfo(id);
		aModelAndView.addObject("user",user);
		aModelAndView.setViewName("QueryUserInfo.jsp");
		return aModelAndView;
	}
	
	
	
	
	
	
	
	
	
	
	
}
