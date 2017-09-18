<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'password.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center>
  
    <form action="isReceive.action" method="post">
    
    密码验证：<input type="password" name="password"/><br/><br/>
   		  <input type="hidden" name="orderid" value=<%=request.getParameter("orderid") %>   /><br/><br/>
   		   <input type="hidden" name="username" value=${userlogin.username}    /><br/><br/>
    <input type="submit"/>
    
    </form>
    </center>
  </body>
</html>
