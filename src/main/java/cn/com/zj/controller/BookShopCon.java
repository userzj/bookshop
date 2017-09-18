package cn.com.zj.controller;




import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import cn.com.zj.pojo.Book;
import cn.com.zj.pojo.Review;
import cn.com.zj.service.BookService;
import cn.com.zj.service.ReviewService;


@Controller
public class BookShopCon {
	@Autowired
	BookService bookservice;
	@Autowired
	ReviewService reviewService;
	
	
	//添加图书
	@RequestMapping("/addbooks.action")
	public ModelAndView insertSelective(Integer status ,String bookname,Integer bookclass, String author,String publish,String bookno,
			String content,Float price ,Integer amount,Integer leavNumber,MultipartFile picture,String regTime) throws IllegalStateException, IOException{
		
		ModelAndView aModelAndView = new ModelAndView();
	int a =	bookservice.insertSelective(status, bookname, bookclass, author, publish, bookno, content, price, amount, leavNumber, picture, regTime);
	if(a >= 0 ){
		aModelAndView.setViewName("addBook.jsp");
		return aModelAndView;
	}else{
		aModelAndView.setViewName("404error.jsp");
		return aModelAndView;
	}			
	}
	
	
	
	//查询全部图书
	@RequestMapping("/selectAllBooks.action")
	public ModelAndView selectAllBooks(){
		ModelAndView aModelAndView = new ModelAndView();
		List<Book> list = bookservice.selectAllBooks();
		aModelAndView.addObject("list", list);
		aModelAndView.setViewName("BookInfo.jsp");
		return aModelAndView;
	}
	
	
	//图书上线1
	
	@RequestMapping("/onLine.action")
	public ModelAndView onLine(){
		List<Book> list = bookservice.onLine();
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.addObject("list", list);
		aModelAndView.setViewName("OnLine.jsp");
		return aModelAndView;
		
	}
	
	//图书上线2
	
	@RequestMapping("/goOnLine.action")
	public ModelAndView goOnLine(Integer id){
		
		ModelAndView aModelAndView = new ModelAndView();
		int a = bookservice.goOnLine(id);
		if(a > 0){
			
			aModelAndView.setViewName("onLine.action");
			return aModelAndView;
		}
		
		else {
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
	}
	
	
	
	
	//图书下线1
	
	@RequestMapping("/offLine.action")
	public ModelAndView offLine(){
		List<Book> list =  bookservice.offLine();
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.addObject("list", list);
		aModelAndView.setViewName("OffLine.jsp");
		return aModelAndView;
		
	}
	
	//图书下线2
	@RequestMapping("/goOffLine.action")
	public ModelAndView goOffLine(Integer id){
		int a =  bookservice.goOffLine(id);
		ModelAndView aModelAndView = new ModelAndView();
		if(a > 0){
			
			aModelAndView.setViewName("offLine.action");
			return aModelAndView;
		}
		
		else {
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
	}
	
	//Admin单个图书详情
	
	@RequestMapping("/selectABook.action")
	public ModelAndView selectABook(Integer id){
	Book book1 = bookservice.selectABook(id);
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.setViewName("ShowABookDetail.jsp");
		aModelAndView.addObject("book1", book1);
		return aModelAndView;
		
	}
	
	
	//修改图书信息
	
	@RequestMapping("/updateABook.action")
	public ModelAndView updateByPrimaryKeySelective(Integer id,Integer status,String bookname,Integer bookclass, String author,String publish,String bookno,
			String content,Float price ,Integer amount,Integer leavNumber,MultipartFile picture,String regTime){
		
		ModelAndView aModelAndView = new ModelAndView();
		int a = bookservice.updateByPrimaryKeySelective(id, status, bookname, bookclass, author, publish, bookno, content, price, amount, leavNumber, picture, regTime);
		if(a >= 0 ){
			
			aModelAndView.setViewName("index.jsp");
			return aModelAndView;
		}
		else {
			aModelAndView.setViewName("404error.jsp");
			return aModelAndView;
		}
		
	}
	
	
	//不足十本图书列表
	
	@RequestMapping("/lackBooksList.action")
	public ModelAndView selectTheLackBooks(){
		List<Book> list =  bookservice.selectTheLackBooks();
		ModelAndView aModelAndView = new ModelAndView();
		aModelAndView.setViewName("TheLackBooks.jsp");
		aModelAndView.addObject("list", list);
		return aModelAndView;
		
		
	}
	
	
	
	
	//用户查看宝贝详情
	
	@SuppressWarnings("null")
	@RequestMapping("/aBookDetail.action")
	public ModelAndView single(Integer id){
	Book book1 = bookservice.single(id);
	Review review = new Review();
	ModelAndView aModelAndView = new ModelAndView();
	if(reviewService.searchReview(id)== null){
		
		 review.setReview("");
		 List<Review> list= null ; 
		 list.add(review);	 
		aModelAndView.setViewName("single.jsp");
		aModelAndView.addObject("list", list);
		aModelAndView.addObject("book1", book1);
	}else{
		List<Review> list = reviewService.searchReview(id);
		aModelAndView.setViewName("single.jsp");
		aModelAndView.addObject("list", list);
		aModelAndView.addObject("book1", book1);
	}

		return aModelAndView;
		
	}
	
	
	//搜索图书
	@RequestMapping("/searchBooks.action")
	public ModelAndView searchBooks(String bookname,Integer bookclass){
		Book book = new Book();
		book.setBookname("%"+bookname+"%");
		book.setBookclass(bookclass);
		ModelAndView aModelAndView = new ModelAndView();
		if(book.getBookclass() == 0){
			 List<Book> list =bookservice.searchBooksNoClass(book);
			 aModelAndView.setViewName("mens.jsp");
				aModelAndView.addObject("list", list);
				return aModelAndView;
		}else{
			 List<Book> list = bookservice.searchBooksWithClass(book);
			 aModelAndView.setViewName("mens.jsp");
				aModelAndView.addObject("list", list);
				return aModelAndView;
		}
	
	}
	//按分类查找图书
	@RequestMapping("/searchBooksAsclassification.action")
	public ModelAndView searchBooksAsclassification(Integer bookclass ){
			ModelAndView aModelAndView = new ModelAndView();
			List<Book> list = bookservice.searchBooksAsclassification(bookclass);
			aModelAndView.setViewName("mens.jsp");
			aModelAndView.addObject("list", list);
			return aModelAndView;
		
	
	
	}
	//图书减少
	@RequestMapping("/bookLess.action")
	public ModelAndView bookLess(Integer Number,Integer id ){//bookid
			ModelAndView aModelAndView = new ModelAndView();
			int a = bookservice.selectBookNum(id);
			int leavenum = a - Number;
			Book book = new Book ();
			book.setId(id);
			book.setLeavNumber(leavenum);
			int b  = bookservice.bookLess(book);
			if(b >= 0 ){
				
				aModelAndView.setViewName("index.jsp");
				return aModelAndView;
			}
			else {
				aModelAndView.setViewName("404error.jsp");
				return aModelAndView;
			}
			
		}
	@RequestMapping("/querysale.action")
	public ModelAndView querysale(Integer bookclass) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		int sum = 0;
		int salesum = 0;
		List<Book> list = bookservice.selectAllBooks();
		for(Book book : list){
			if(book.getBookclass() != bookclass){
				 int sale = book.getAmount() - book.getLeavNumber();
				
				 salesum=sale + salesum;
			}
			
			sum+=book.getAmount();				
		}
		double salesum1 = salesum * 1.0;
		double sum1 = sum *1.0;
		double fen = salesum1/sum1;
		System.out.println(fen);
		System.out.println(sum1);
		System.out.println(salesum1);
		 DecimalFormat df1 = new DecimalFormat("##.00%");
		String bfb = df1.format(fen); 
		mav.addObject("bfb", bfb);
		mav.setViewName("test1.jsp");
		return mav;
	}
		
}
