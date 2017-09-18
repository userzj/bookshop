package cn.com.zj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.zj.mapper.OrderdetailMapper;
import cn.com.zj.pojo.Orderdetail;

public class OrderDetailService {
	@Autowired
	OrderdetailMapper orderdetailMapper;
	
	@RequestMapping("/insertOrderDetail.action")
	public int insertOrderDetail(Orderdetail aOrderdetail){
		int a  = orderdetailMapper.insertSelective(aOrderdetail);
		return a;
	}
	
	
	
	
	
	
	
	
}
