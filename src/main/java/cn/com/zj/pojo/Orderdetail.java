package cn.com.zj.pojo;

public class Orderdetail {
    private Integer id;

    private Integer orderid;

    private Integer bookid;

    private Integer singalnum;
    
    private Integer status;

    public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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