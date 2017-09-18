package cn.com.zj.mapper;



import java.util.List;

import cn.com.zj.pojo.Book;


public interface BookMapper {


	 List<Book> selectAllBooks();
	 
	 List<Book> selectOffLinefBooks();
	 
	 List<Book> selectOnLinefBooks();
	 
	 List<Book>	selectTheLackBooks();
	 
	 List<Book> searchBooksNoClass(Book record);
	 
	 List<Book> searchBooksWithClass(Book record);
	 
	 List<Book> searchBooksAsclassification(Integer bookclass);
	 
	 int deleteByPrimaryKey(Integer id);

	    int insert(Book record);

	    int insertSelective(Book record);

	    Book selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(Book record);

	    int updateByPrimaryKeyWithBLOBs(Book record);

	    int updateByPrimaryKey(Book record);
	    
	    int goOnLineUpdate(Integer id);
	    
	    int goOffLineUpdate(Integer id);
	    
	    int bookLess(Book book);
	    
	    int selectBookNum(Integer id);
	
}
