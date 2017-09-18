package cn.com.zj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.zj.mapper.ReviewMapper;
import cn.com.zj.pojo.Review;

public class ReviewService {
	@Autowired
	ReviewMapper reviewMapper;
	
	public int insertReview(String review ,Integer userid ,Integer bookid){
		Review areview = new Review();
		areview.setBookid(bookid);
		areview.setUserid(userid);
		areview.setReview(review);
		int a  = reviewMapper.insertSelective(areview);
		return a;
	}
	public int delReview(Integer id){
		int a  = reviewMapper.deleteByPrimaryKey(id);
		return a;
	}
	public int updateReview(Review aReview){
		int a  = reviewMapper.updateByPrimaryKeySelective(aReview);
		return a;
	}
	public List<Review> searchReview(Integer bookid){
		List<Review> list =  reviewMapper.searchReview(bookid);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
