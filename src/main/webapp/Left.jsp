<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>左边栏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
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
   <%
  String username = session.getAttribute("username").toString();
    	%>
  <font color = "red" size = "5">管理员:<%=username %> ,欢迎您！</font>
  	<hr width = "100%">
    <img src = "images/d1.jpg" width = "100%" height = "20%">
    <hr width = "100%">
           图书管理：<br/>
    <center>
   			<a href = "addBook.jsp" target = "showPage">添加图书</a><br/><br/>
    		<a href = "selectAllBooks.action" target = "showPage">图书列表</a><br/><br/>
    		<a href = "lackBooksList.action" target = "showPage">补货列表</a><br/><br/>
    		<a href = "onLine.action" target = "showPage">图书上线</a><br/><br/>
    		<a href = "offLine.action" target = "showPage">图书下线</a><br/>
    </center>
           用户管理：<br/>
     <center>
            <a href = "selectAllUsers.action" target = "showPage">用户列表</a><br/><br/>
            <a href = "selectAllAdmin.action" target = "showPage">管理员名单</a><br/><br/>
           
     </center>
   	 订单管理：<br/>
   	  <center>
   	     	<a href = "selectAllOrders.action" target = "showPage">全部订单</a><br/><br/>
   	     	 <a href = "selectAllBooks.action" target = "showPage">评论管理</a><br/><br/>
   	     	 
      </center>
 	 站内统计：<br/>
   	  <center>
   	     	<a href = "SaleByTime.jsp" target = "showPage">时间段销售明细</a><br/><br/>
    		<a href = "SaleOthers.jsp" target = "showPage">分类商品销售比例</a><br/><br/>
      </center>
  </body>
</html>
