<%@ page language="java"   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'confirm.jsp' starting page</title>
    
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
    <table border="1" width="490">
    	<tr>
    		<td colspan="6">商品信息</td>
    	</tr>
    	<tr>
    		<td>商品序号</td>
    		<td>商品名称</td>
    		<td>商品单价</td>
    		<td>商品数量</td>
    		<td>小记</td>
    	</tr>
    	<c:forEach items="${sessionScope.forder}" var="sorder" varStatus="num">
  	<tr>
  		<td>${num.count}</td>
  		<td>${sorder.gname}</td>
  		<td>${sorder.gprice}元</td>
  		<td>${sorder.gnumber}</td>
  		<td>${sorder.gprice*sorder.gnumber}</td>
  	</tr>
  	</c:forEach>
  	<tr>
  		<td colspan="3" align="right">总计：</td>
  		<td colspan="2" align="left">${sessionScope.ftotal}元</td>
  	</tr>
    </table>
    <form action="<%=request.getContextPath()%>/users/lastConfirm.jsp" method="post">
    <table border="1" width="490">
    	<tr>
    		<td>用户信息</td>
    	</tr>
    	<tr>
    		<td>联系人：</td>
    		<td><input type="text" name="uname" value="${sessionScope.user.uname}"></td>
    		<td>联系电话：</td>
    		<td><input type="text" name="uphone" value="${sessionScope.user.uphone}"></td>
    	</tr>
    	<tr>
    		<td>Email：</td>
    		<td><input type="text" name="uemail" value="${sessionScope.user.uemail}"></td>
    		<td>邮编：</td>
    		<td><input type="text" name="upost" value="${sessionScope.user.upost}"></td>
    	</tr>
    	<tr>
    		<td >地址：</td>
    		<td colspan="3"><input type="text" name="uaddress" value="${sessionScope.user.uaddress}" size="60"></td>
    	</tr>
    	<tr>
    		<td colspan="4">客人附加要求：</td>
    	</tr>
    	<tr>
    		<td colspan="4"><textarea name="fremark" cols="50" rows="7">我要退货！！！</textarea></td>
    	</tr>
    </table>
    <input type="submit" value="提交订单">
    </form>
  </body>
</html>
