package cn.com.zj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import cn.com.zj.pojo.Cart;
import cn.com.zj.pojo.CartDetail;
import cn.com.zj.service.BookService;
import cn.com.zj.service.CartService;

@Controller
public class CartController {
	@Autowired
	CartService cartService;
	@Autowired
	BookService bookservice;
	

	//按钮加入购物车
	@RequestMapping("/addToCart.action")
	public ModelAndView addToCart(Integer id){
		
		int a  = cartService.addToCart(id);
		
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
	
	
	
	
	
	//删除购物车
	@RequestMapping("/delToCart.action")
	public ModelAndView delToCart(Integer id ){
		int a  = cartService.delToCart(id);
		ModelAndView aModelAndView = new ModelAndView();
		if(a >= 0 ){			
			aModelAndView.setViewName("selToCart.action");
			return aModelAndView;
		}
		else{
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}	
	}
	
	
	
	

	//修改购物车
	@RequestMapping("/updToCart.action")
	public ModelAndView updToCart(Cart cart ){
		int a  =cartService.updToCart(cart);
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
	
	
	
	

	//查看购物车	
	@RequestMapping("/selToCart.action")
	public ModelAndView selToCart( Integer userid){
		 List<CartDetail> list  =cartService.selToCart(userid);
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.addObject("list", list);
		aModelAndView.setViewName("checkout.jsp");
		return aModelAndView;
		
	}

	//清空购物车
	@RequestMapping("/emptyCart.action")
	public ModelAndView emptyCart(Integer userid ){
		int a  = cartService.emptyCart(userid);
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
	
}
