package cn.com.zj.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import cn.com.zj.pojo.Book;
import cn.com.zj.pojo.Cart;
import cn.com.zj.pojo.CartDetail;
import cn.com.zj.pojo.OrderOrderDetail;
import cn.com.zj.pojo.Orderdetail;
import cn.com.zj.pojo.Orders;
import cn.com.zj.pojo.User;
import cn.com.zj.service.BookService;
import cn.com.zj.service.CartService;
import cn.com.zj.service.OrderDetailService;
import cn.com.zj.service.OrderService;
import cn.com.zj.service.UserService;


@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	OrderDetailService orderDetailService;
	@Autowired
	CartService cartService;
	@Autowired
	UserService userService;
	@Autowired
	BookService bookservice;
	
	//单个订单查询
	
	@RequestMapping("/findOrderList.action")
	public ModelAndView findOrderList(Integer id ){
		User user = orderService.findOrderList(id);
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.addObject("user", user);
		aModelAndView.setViewName("findOrderList.jsp");
		return aModelAndView;
		
	}
	
	
	
	//修改订单
	
	@RequestMapping("/updateOrder.action")
	public ModelAndView updateByPrimaryKeySelective(Integer id ){
		Orders order = orderService.updateByPrimaryKeySelective1(id);
		int a = orderService.updateByPrimaryKeySelective2(order);
		ModelAndView aModelAndView = new ModelAndView();
		if(a >= 0 ){
			
			aModelAndView.setViewName("index.jsp");
			return aModelAndView;
		}
		else{
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
		
	}
	
	
	//修改确认发货
	
	@RequestMapping("/isGoUpdate.action")
	public ModelAndView isGoUpdate(Integer id ){
		Orders order = orderService.selectByPrimaryKey(id);
		List<OrderOrderDetail> list = orderService.userFindOrderItem(order);
		for (OrderOrderDetail aOrderOrderDetail : list) {
			// 获取book的ID
			int bookid = aOrderOrderDetail.getBookid();
			// 查出整条book数据
			Book book = bookservice.selectByPrimaryKey(bookid);
			
			int  LeavNumber = book.getLeavNumber();
			// 获取订单详情中的货物数量
			int num = aOrderOrderDetail.getSingalnum();
			// 得到Goods新Inventory
			int newInventory = LeavNumber - num;
			// 设置新库存
			book.setLeavNumber(newInventory);
			// 传入数据修改
			bookservice.updateByPrimaryKey(book);
		}
		int a = orderService.isGoUpdate(id);
		ModelAndView aModelAndView = new ModelAndView();
		if(a >= 0 ){
			
			aModelAndView.setViewName("selectAllOrders.action");
			return aModelAndView;
		}
		else{
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
		
	}
	
	
	
	//用户订单查询
	
	@RequestMapping("/UserfindOrderList.action")
	public ModelAndView userFindOrderList(Integer id ){
		User user = userService.selectByPrimaryKey(id);
		 List<Orders> list = orderService.userFindOrderList(id);
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.addObject("list", list);
		aModelAndView.addObject("user", user);
		aModelAndView.setViewName("findOrderList.jsp");
		return aModelAndView;
		
	}
	

	//用户订单项查询
	
	@RequestMapping("/userFindOrderItem.action")
	public ModelAndView userFindOrderItem(Orders order){
		List<OrderOrderDetail> list = orderService.userFindOrderItem(order);
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.addObject("list", list);
		aModelAndView.setViewName("userFindOrderItem.jsp");
		return aModelAndView;
		
	}
	
	
	
	//管理员全部订单查询	
	@RequestMapping("/selectAllOrders.action")
	public ModelAndView selectAllOrders(){
		List<Orders> list = orderService.selectAllOrders();
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.addObject("list", list);
		aModelAndView.setViewName("selectAllOrders.jsp");
		return aModelAndView;
		
	}
	
	//关闭订单
	
	@RequestMapping("/closeOrder.action")
	public ModelAndView closeOrder(Integer id ){
		
		int a = orderService.closeOrder(id);
		ModelAndView aModelAndView = new ModelAndView();
		if(a >= 0 ){
			
			aModelAndView.setViewName("selectAllOrders.action");
			return aModelAndView;
		}
		else{
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
		
	}
	
	
	
	//生成订单订单项
	
	@RequestMapping("/addOrder.action")
	public ModelAndView addOrder(Integer userid ,Float totalprice ){
		Orders order = new Orders();
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		order.setSubmitTime(format.format(date));
		order.setIsgo(0);
		order.setStatus(1);
		order.setUserId(userid);
		order.setIspayoff(1);
		order.setTotalprice(totalprice);
		int a =	orderService.addOrder(order);
			
		List<CartDetail> cartdetail = cartService.selToCart(userid);	
		for(Cart cart:cartdetail){
			Orderdetail aOrderdetail = new Orderdetail();
			aOrderdetail.setBookid(cart.getBookid());
			aOrderdetail.setOrderid(order.getId());
			aOrderdetail.setSingalnum(cart.getSingalnum());
			orderDetailService.insertOrderDetail(aOrderdetail);		
		}	
		ModelAndView aModelAndView = new ModelAndView();
		if(a >= 0 ){
			List<OrderOrderDetail> list = orderService.userFindOrderItem(order);
			aModelAndView.addObject("orderid", order.getId());
			aModelAndView.addObject("list", list);
			aModelAndView.setViewName("OrderLook.jsp");
			return aModelAndView;
			
		}
		else{
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
		
	}
	// 根据时间流水线查询
	@RequestMapping("/salebytime.action")
	public ModelAndView salebytime(HttpServletRequest request)
			throws ParseException {
		ModelAndView mav = new ModelAndView();
		System.out.println(request.getParameter("starttime"));
		System.out.println(request.getParameter("overtime"));
		System.out.println(request.getParameter("pageNum"));
		
		String pageNum = request.getParameter("pageNum");
		Integer pageNum1 = 0;
		Integer pageSize = 6;
		Integer lastdata = 0;
		Integer allData = bookservice.selectAllBooks().size();
		Integer lastPage = allData % pageSize == 0 ? allData / pageSize
				: allData / pageSize + 1;
		if (pageNum == null) {
			pageNum1 = 0;
			lastdata = 6;
		} else {
			pageNum1 = Integer.parseInt(pageNum);
			if (pageNum1 > lastPage) {
				pageNum1 = lastPage;
			} else if (pageNum1 < 1) {
				pageNum1 = 1;
			}
			lastdata = pageNum1 * pageSize;
		}
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		Date starttime = df.parse((String) request.getParameter("starttime"));
		Date overtime = df.parse((String) request.getParameter("overtime"));
		List<OrderOrderDetail> list = orderService.queryByTimeWater(starttime, overtime,lastdata,pageSize);
		mav.addObject("starttime", request.getParameter("starttime"));
		mav.addObject("overtime", request.getParameter("overtime"));
		mav.addObject("salelist", list);
		mav.addObject("pageNum", pageNum1 + "");
		mav.addObject("lastPage", lastPage);
		mav.setViewName("SaleByTime.jsp");
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
