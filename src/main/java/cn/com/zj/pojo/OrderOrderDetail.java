package cn.com.zj.pojo;

public class OrderOrderDetail extends Orders {

	 private Integer id;

	    private Integer orderid;

	    private Integer bookid;

	    private Integer singalnum;
	    
	    private String  bookname;
	    

		public String getBookname() {
			return bookname;
		}

		public void setBookname(String bookname) {
			this.bookname = bookname;
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public Integer getOrderid() {
			return orderid;
		}

		public void setOrderid(Integer orderid) {
			this.orderid = orderid;
		}

		public Integer getBookid() {
			return bookid;
		}

		public void setBookid(Integer bookid) {
			this.bookid = bookid;
		}

		public Integer getSingalnum() {
			return singalnum;
		}

		public void setSingalnum(Integer singalnum) {
			this.singalnum = singalnum;
		}
	
	
	
	
	
	
	
	
	
}
