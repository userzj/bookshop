<%@ page language="java" import="java.util.*"
	import="java.text.DateFormat" import="cn.com.zj.pojo.*" pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>销售明细</title>

	<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />


<!-- //pignose css -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
	<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>

  </head>

	<body>
		<form action="salebytime.action" method="post">
			起始时间：
			<input type="date" name="starttime" value="2016-01-01" />
			终止时间：
			<input type="date" name="overtime" value="2017-01-01" />
			&nbsp;&nbsp;&nbsp;
			<input type="submit" value="查询">
		</form>
		<%	List<OrderOrderDetail> orlist = (List<OrderOrderDetail>) request.getAttribute("salelist");
			if(orlist != null){
			String pageNum = (String) request.getAttribute("pageNum");
			Integer pageNum1 = Integer.parseInt(pageNum);
			Integer lastPage = (Integer) request.getAttribute("lastPage");
			if (orlist != null && orlist.size() != 0) {
		%>
		<font size="2" color="bule">
			您好，尊敬的管理员，从${starttime}到${overtime}的销售明细如下:(以用户确认收货时间为准) </font>
		<br />
		<div class="bs-docs-example">
            <table class="table">
              <thead>
			<tr>
				<td>
					商品名称
				</td>
				<td>
					商品数量
				</td>
				<td>
					购买用户
				</td>
				<td>
					花费金额
				</td>
				<td>
					成交日期
				</td>
				<td>
					所属订单号
				</td>
			</tr>
			 </thead>
              <tbody>
			<%
				for (OrderOrderDetail orderdetail : orlist) {
						
						
			%>
			<tr>
				<td><%=orderdetail.getBookname()%></td>
				<td><%=orderdetail.getSingalnum()%></td>
				<td><%=orderdetail.getUserId()%></td>
				<td><%=orderdetail.getTotalprice()%></td>
				<td><%=orderdetail.getConsignmenttime()%> </td>
				<td><%=orderdetail.getOrderid()%></td>
				
			</tr>
			
			<%
				
					}
			%>
		
		  </tbody>
            </table>
          </div>
  			<div class="col-sm-6 newsright">
					
					
									
			</div>
		<br>
		<a
			href="salebytime.action?pageNum=1&starttime=<%=request.getAttribute("starttime")%>&overtime=<%=request.getAttribute("overtime")%>">首页</a>||
		<a
			href="salebytime.action?pageNum=<%=pageNum1 - 1%>&starttime=<%=request.getAttribute("starttime")%>&overtime=<%=request.getAttribute("overtime")%>">上一页</a>||
		<a
			href="salebytime.action?pageNum=<%=pageNum1 + 1%>&starttime=<%=request.getAttribute("starttime")%>&overtime=<%=request.getAttribute("overtime")%>">下一页</a>||
		<a	
			href="salebytime.action?pageNum=<%=lastPage%>&starttime=<%=request.getAttribute("starttime")%>&overtime=<%=request.getAttribute("overtime")%>">尾页</a>
	
		<br/>
		
		<%
			} }else if (orlist == null) {
		%>
		<%=""%>
		<%
			} else {
		%>
		<font size="4" color="red">
			很抱歉，未查询到从${starttime}到${overtime}的销售记录。 </font>
		<%
			}
		%>

	</body>
</html>
