package cn.com.zj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.zj.pojo.CartDetail;
import cn.com.zj.mapper.CartMapper;
import cn.com.zj.pojo.Cart;

public class CartService {
	@Autowired
	CartMapper cartMapper;
	
	public int addToCart(Integer bookid){
		Cart cart = new Cart();
		cart.setBookid(bookid);
		cart.setSingalnum(1);
		cart.setUserid(1);
		int a;
		Cart cart1 = cartMapper.selectCartSameNum(cart);
		if(cart1 != null){
			cart1.setSingalnum(cart1.getSingalnum() + 1);
			a =cartMapper.updateCartNum(cart1);
		}else{
			a  = cartMapper.insertSelective(cart);
		}
		
		return a;
		
	}
	public int delToCart(Integer id){
		int a  = cartMapper.deleteByPrimaryKey(id);
		return a;
		
	}
	public int updToCart(Cart cart){
		int a  =  cartMapper.updateByPrimaryKeySelective(cart);
		return a;
		
	}
	public List<CartDetail> selToCart( Integer userid){
		List<CartDetail> list  = cartMapper.selectByUserid(userid);
		return list;
	}
	public int emptyCart(Integer userid){
		int a = cartMapper.emptyCart(userid);
		return a;
	}
	
	
	
	
	
	
	
	
	
}
