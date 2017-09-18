package cn.com.zj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zj.pojo.OrderOrderDetail;
import cn.com.zj.pojo.Orderdetail;

public interface OrderdetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Orderdetail record);

    int insertSelective(Orderdetail record);

    Orderdetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Orderdetail record);

    int updateByPrimaryKey(Orderdetail record);
    
    List<OrderOrderDetail> OrderOrderDetailList(@Param("orderid")Integer orderid,@Param("userid")Integer userid );//一个订单对应的订单项
    
    List<OrderOrderDetail> selectAllOrders();
    
   
}