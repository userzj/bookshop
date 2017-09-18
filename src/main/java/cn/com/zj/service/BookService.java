package cn.com.zj.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import cn.com.zj.mapper.BookMapper;
import cn.com.zj.pojo.Book;

public class BookService {
	@Autowired
	BookMapper bookMapper;
	
	public int insertSelective(Integer status ,String bookname,Integer bookclass, String author,String publish,String bookno,
			String content,Float price ,Integer amount,Integer leavNumber,MultipartFile picture,String regTime) throws IllegalStateException, IOException{
		Book book = new Book ();
		book.setBookname(bookname);
		book.setBookclass(bookclass);
		book.setAuthor(author);
		book.setPublish(publish);
		book.setAmount(amount);
		book.setBookno(bookno);
		book.setContent(content);
		book.setLeavNumber(leavNumber);
		book.setPrice(price);
		book.setRegTime(regTime);
		book.setStatus(status);
		if (picture != null) {
			//原始文件名
			String originalFilename = picture.getOriginalFilename();
			//新文件名
			String fileName = UUID.randomUUID() + 
					originalFilename.substring(originalFilename.lastIndexOf("."));
			//保存图片
			picture.transferTo(new File("D:\\apache-tomcat-7.0.55\\webapps\\bookshop\\images\\" + fileName));
			//保存文件名至数据库
			 book.setPicture(fileName);
		}
		int a =	bookMapper.insertSelective(book);
		return a;
	}
	
	public List<Book> selectAllBooks(){
		List<Book> list =  bookMapper.selectAllBooks();
		return list;
		
	}
	
	public List<Book> onLine(){
		List<Book> list =  bookMapper.selectOffLinefBooks();
		return list;
	}
	
	public int goOnLine(Integer id){
		int a =  bookMapper.goOnLineUpdate(id);
		return a;
	}
	
	public List<Book> offLine(){
		List<Book> list =  bookMapper.selectOnLinefBooks();
		return list;
	}
	
	public int goOffLine(Integer id){
		int a =  bookMapper.goOffLineUpdate(id);
		return a;
	}
	public Book selectABook(Integer id){
		Book book1 = bookMapper.selectByPrimaryKey(id);
		return book1;
	}
	public int updateByPrimaryKeySelective(Integer id,Integer status,String bookname,Integer bookclass, String author,String publish,String bookno,
			String content,Float price ,Integer amount,Integer leavNumber,MultipartFile picture,String regTime){
		Book book = bookMapper.selectByPrimaryKey(id);
		book.setBookname(bookname);
		book.setBookclass(bookclass);
		book.setAuthor(author);
		book.setPublish(publish);
		book.setAmount(amount);
		book.setBookno(bookno);
		book.setContent(content);
		book.setLeavNumber(leavNumber);
		book.setPrice(price);
		book.setRegTime(regTime);
		book.setStatus(status);
		int a = bookMapper.updateByPrimaryKeyWithBLOBs(book);
		return a;
	}
	public List<Book> selectTheLackBooks(){
		List<Book> list =  bookMapper.selectTheLackBooks();
		return list;
	}
	public Book single(Integer id){
		Book book1 = bookMapper.selectByPrimaryKey(id);
		return book1;
	}
	public List<Book> searchBooksNoClass(Book book){
		List<Book> list = bookMapper.searchBooksNoClass(book);
		return list;
	}
	public List<Book> searchBooksWithClass(Book book){
		List<Book> list = bookMapper.searchBooksWithClass(book);
		return list;
	}
	public List<Book> searchBooksAsclassification(Integer bookclass){
		List<Book> list  = bookMapper.searchBooksAsclassification(bookclass);
		return list;
	}
	public int bookLess(Book book){
		int a = bookMapper.bookLess(book);
		return a;
	}
	public int selectBookNum(Integer id){
		int a = bookMapper.selectBookNum(id);
		return a;
	}
	public Book selectByPrimaryKey(Integer id){
		Book book = bookMapper.selectByPrimaryKey(id);
		return book;
	}
	public int updateByPrimaryKey(Book book){
		int a =bookMapper.updateByPrimaryKey(book);
		return a;
	}
	
	
	
	
	
	
	
	
	
	
}
