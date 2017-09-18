package cn.com.zj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zj.pojo.Cart;
import cn.com.zj.pojo.CartDetail;
import cn.com.zj.pojo.Orderdetail;
import cn.com.zj.service.CartService;
import cn.com.zj.service.OrderDetailService;


@Controller
public class OrderDetailController {	
	@Autowired
	OrderDetailService orderDetailService;
	@Autowired
	CartService cartService;
	
	//购物车转订单详情
	@RequestMapping("/insertOrderDetail.action")
	public ModelAndView insertOrderDetail(Integer userid){
		List<CartDetail> cartdetail = cartService.selToCart(userid);
		
		for(Cart cart:cartdetail){
			Orderdetail aOrderdetail = new Orderdetail();
			aOrderdetail.setBookid(cart.getBookid());
			aOrderdetail.setOrderid(1);
			aOrderdetail.setSingalnum(cart.getSingalnum());
			orderDetailService.insertOrderDetail(aOrderdetail);
		}
		
		ModelAndView aModelAndView = new ModelAndView();
		
			
			aModelAndView.setViewName("index.jsp");
			return aModelAndView;
		
		
	}
	

}
