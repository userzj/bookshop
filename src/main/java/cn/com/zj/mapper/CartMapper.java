package cn.com.zj.mapper;

import java.util.List;

import cn.com.zj.pojo.CartDetail;
import cn.com.zj.pojo.Cart;

public interface CartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);
    
    List<CartDetail> selectByUserid(Integer id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
    
    int emptyCart(Integer userid);
    
    Cart selectCartSameNum(Cart cart);
    
    int updateCartNum(Cart cart);
}