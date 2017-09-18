package cn.com.zj.mapper;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import cn.com.zj.pojo.OrderOrderDetail;
import cn.com.zj.pojo.Orders;
import cn.com.zj.pojo.User;

public interface OrdersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
    
    User findOrderList(Integer id);
    
    int isGoUpdate (Integer id);
    
    int closeOrder (Integer id );

	List<OrderOrderDetail> OrderOrderDetailList(Orders order);

	List<Orders> selectAllOrders();
	
	List<Orders> selOrderList(Integer id);
	
	int isReceive(Orders order);
	
	List<OrderOrderDetail> selectByTimeWater(@Param("starttime")Date starttime, @Param("overtime")Date overtime,
			@Param("lastdata")Integer lastdata, @Param("pageSize")Integer pageSize);
    
    
}