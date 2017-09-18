package cn.com.zj.pojo;



public class Orders {
    private Integer id;

    private Integer userId;

    private Integer number;

    private String submitTime;

    private String consignmenttime;

    private Float totalprice;

    private String content;

    private Integer ispayoff;

    private Integer isgo;

    private Integer status;
    
   

  
	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(String submitTime) {
        this.submitTime = submitTime == null ? null : submitTime.trim();
    }

    public String getConsignmenttime() {
        return consignmenttime;
    }

    public void setConsignmenttime(String consignmenttime) {
        this.consignmenttime = consignmenttime == null ? null : consignmenttime.trim();
    }

    public Float getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Float totalprice) {
        this.totalprice = totalprice;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getIspayoff() {
        return ispayoff;
    }

    public void setIspayoff(Integer ispayoff) {
        this.ispayoff = ispayoff;
    }

    public Integer getIsgo() {
        return isgo;
    }

    public void setIsgo(Integer isgo) {
        this.isgo = isgo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}