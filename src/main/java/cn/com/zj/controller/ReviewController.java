package cn.com.zj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import cn.com.zj.pojo.Review;
import cn.com.zj.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	
	
	
	//删除评论
	
	@RequestMapping("/delReview.action")
	public ModelAndView delReview(Integer id){
		int a  = reviewService.delReview(id);
		ModelAndView aModelAndView = new ModelAndView();
		if(a >= 0 ){		
			aModelAndView.setViewName("selectAllBooks.action");
			return aModelAndView;
		}
		else{
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
	}
	
	
	//修改评论
	@RequestMapping("/updateReview.action")
	public ModelAndView updateReview(Review aReview){
		int a  = reviewService.updateReview(aReview);
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
	//查看评论
	@RequestMapping("/searchReview.action")
	public ModelAndView searchReview(Integer bookid){
		List<Review> list = reviewService.searchReview(bookid);
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.setViewName("searchReviewByBookid.jsp");
		aModelAndView.addObject("list", list);
		return aModelAndView;
	}
	
	//增加评论	
	@RequestMapping("/insertReview.action")
	public ModelAndView insertReview(String review ,Integer userid ,Integer bookid){
		int a  =reviewService.insertReview(review, userid, bookid);
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
