<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>确认支付</title>
    
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
  	<center><h3>确定支付</h3></center>
  	<table>
  		<tr>
  			<td>订单编号:</td>
  			<td>${sessionScope.forder.fid}</td>
  		</tr>
  		<tr>
  			<td>商品编号:</td>
  			<td>${sessionScope.forder.ftotal}</td>
  		</tr>
  		<tr>
  			<td colspan="2">支付银行:</td>
  		</tr>
  		<tr>
  			<td colspan="2"><img src="/shopping/images/logo/${pd_FrpId}.gif" width="154" height="33"/></td>
  		</tr>
  	</table>
  	<form name="yeepay" action='${requestScope.nodeAuthorizationURL}' method='post' target="_blank">
			<input type='hidden' name='p0_Cmd'   value='${requestScope.onpay.p0_Cmd}'>
			<input type='hidden' name='p1_MerId' value='${requestScope.onpay.p1_MerId}'>
			<input type='hidden' name='p2_Order' value='${requestScope.onpay.p2_Order}'>
			<input type='hidden' name='p3_Amt'   value='${requestScope.onpay.p3_Amt}'>
			<input type='hidden' name='p4_Cur'   value='${requestScope.onpay.p4_Cur}'>
			<input type='hidden' name='p5_Pid'   value='${requestScope.onpay.p5_Pid}'>
			<input type='hidden' name='p6_Pcat'  value='${requestScope.onpay.p6_Pcat}'>
			<input type='hidden' name='p7_Pdesc' value='${requestScope.onpay.p7_Pdesc}'>
			<input type='hidden' name='p8_Url'   value='${requestScope.onpay.p8_Url}'>
			<input type='hidden' name='p9_SAF'   value='${requestScope.onpay.p9_SAF}'>
			<input type='hidden' name='pa_MP'    value='${requestScope.onpay.pa_MP}'>
			<input type='hidden' name='pd_FrpId' value='${requestScope.onpay.pd_FrpId}'>
			<input type="hidden" name="pr_NeedResponse"  value="${requestScope.onpay.pr_NeedResponse}">
			<input type='hidden' name='hmac'     value='${requestScope.hmac}'>
			<input type='submit' value="确定支付"/>
		</form>
  </body>
</html>
