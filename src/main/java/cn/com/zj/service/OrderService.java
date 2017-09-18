package cn.com.zj.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import cn.com.zj.mapper.OrdersMapper;
import cn.com.zj.pojo.OrderOrderDetail;
import cn.com.zj.pojo.Orders;
import cn.com.zj.pojo.User;

public class OrderService {
	@Autowired
	OrdersMapper ordersMapper;
	
	public User findOrderList(Integer id ){
		User user = ordersMapper.findOrderList(1);
		return user;
	}
	public Orders updateByPrimaryKeySelective1(Integer id){
		Orders order = ordersMapper.selectByPrimaryKey(id);
		return order;
	}
	public int updateByPrimaryKeySelective2(Orders order){
		int a = ordersMapper.updateByPrimaryKeySelective(order);
		return a;
	}
	public int isGoUpdate(Integer id){
		int a = ordersMapper.isGoUpdate(id);
		return a;
	}
	public List<Orders> userFindOrderList(Integer id ){
		List<Orders> list = ordersMapper.selOrderList(id);
		return list;
	}
	public List<OrderOrderDetail> userFindOrderItem(Orders order){
		List<OrderOrderDetail> list = ordersMapper.OrderOrderDetailList(order);
		return list;
	}
	public List<Orders> selectAllOrders(){
		List<Orders> list = ordersMapper.selectAllOrders();
		return list;
	}
	public int closeOrder(Integer id){
		int a = ordersMapper.closeOrder(id);
		return a;
	}
	public int addOrder(Orders order ){
		
		
		
		int a =	ordersMapper.insertSelective(order);
		return a;	
	}
	public int isReceive(Integer orderid){
		Orders order = new Orders ();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		order.setConsignmenttime(df.format(new Date()));// new Date()为获取当前系统时间
		order.setId(orderid);	
		int a = ordersMapper.isReceive(order);
		return a;

	}
	public Orders selectByPrimaryKey(Integer id){
		Orders order = ordersMapper.selectByPrimaryKey(id);
		return order;
	}
	public List<OrderOrderDetail> queryByTimeWater(Date starttime, Date overtime,
			Integer lastdata, Integer pageSize) {
		// TODO Auto-generated method stub
		//orderdetailMapper.clean();
		return ordersMapper.selectByTimeWater(starttime,overtime,lastdata,pageSize);
	}
	
	
	
	
	
	
	
	
	
	
}
