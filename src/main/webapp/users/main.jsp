<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="/shopping/css/index/index.css" rel="stylesheet" type="text/css" />
<link href="/shopping/index/index.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	* {
		margin:0px;
		font-size:12px;
		color:#666666;
	}
	#maintable{
		margin: 0px auto;
	}
</style>
<style type="text/css">
	* {
		margin:0px;
		font-size:12px;
		color:#666666;
	}
	#users .border{
		width:7px; height:100px; background-repeat:repeat-y;
	}
	#users #use{float:left;}
	#users #use p{margin:20px 0px 10px 12px;}
	.dingdan{background-image:url(/shopping/images/users/users-mid.jpg); height:100px; padding:10px;}
	.dingdan p{border-bottom:1px dashed #cccccc; margin-bottom:6px; padding-left:20px; padding-bottom:6px;}
	.dingdan p a{color:#000000;}
	#xinxi{padding:15px;}
	#xinxi p{margin:8px 0px;}
	#xinxi table td{height:25px; text-align:center;border-bottom:1px solid #E5E5E5; border-right:1px solid #E5E5E5;}
</style>
</head>

<body>
<table width="990" border="0" align="center" cellpadding="0" cellspacing="0" id="maintable">
  <tr>
    <td height="215">
    <div style="width:980px; margin:0px auto;">
  <div id="top">
    	<div id="con">
        	<span class="c" style="padding-left:30px;"><a href="/shopping/index.jsp"  target="_parent">Gogo首页</a></span>
            <span>|</span>
            <span class="c"><a href="/shopping/users/showCar.jsp">我的购物车</a></span>
             <span>|</span>
            	<span class="c"><a href="/shopping/users/main.jsp" target="_parent">我的Gogo</a></span>
            <span style="margin-left:40px;">${sessionScope.users.uname}欢迎光临Gogo商城！</span>
            <c:if test="${sessionScope.users==null}">
            <span><strong style="color:#D369D7;">
            	[<a href="/shopping/userEnrol.jsp" style="color:#D369D7;">注册</a>/<a href="/shopping/usersLogin.jsp" style="color:#D369D7;">登录</a>]</strong>
           	</span>
            </c:if>
      	</div>
   	 	<div id="logo">
      		<img style="float:left;" src="/shopping/images/index/logo.jpg" width="220" height="80"/>
            <div id="beat">
            	<img style="float:left" src="/shopping/images/index/top_line2_search_01.gif" />
            </div>
            <div id="car">
            	<img style="float:left" src="/shopping/images/index/shop-left.jpg" />
                <img style="float:right" src="/shopping/images/index/shop-right.jpg" />
                <span style="color:#000000; margin-left:10px;">购物车:</span>
                <span style="color:#FF0000; font:bold"><c:choose>
	                		<c:when test="${sessionScope.goodnum==null}">0</c:when>
	                		<c:otherwise>${sessionScope.goodnum}</c:otherwise>
	                	</c:choose></span><span>件商品</span>
                <span style="margin-left:15px;"><a href="/shopping/users/showCar.jsp" style="color:#FF0000;">去结算>></a>
                </span>
           	</div>
      	</div>
      		<div id="menu">
      		<img style="float:left" src="/shopping/images/index/menu-l.gif" />
        	<img style="float:right" src="/shopping/images/index/menu-r.gif" />
            <ul>
       		  	<li><a href="/shopping/index.jsp"><b>首页</b></a></li>
               	<li class="img"><img style="float:left;" src="/shopping/images/index/split.jpg" /></li>            	
<%--             	<c:forEach items="${applicationScope.goodlist}" var="list">
							<li>
								<a href="#" class="c"><b>${list[0][1].ctype}</b> </a>
							</li>
							<li class="img">
								<img style="float: left;" src="/shopping/images/index/split.jpg" />
							</li>
				</c:forEach> --%>
        	</ul>
    	</div>
  </div>
  <div style="background-image:url(/shopping/images/users/bg.jpg); height:27px; border:1px solid #cccccc; margin:20px 0px;">
        	<img src="/shopping/images/users/Snap3.jpg" />
	</div>
    </td>
  </tr>
  <tr>
    <td  align="left" valign="top">
	
	</td>
  </tr>
  <tr>
    <td align="left" valign="top"><table width="100%" height="133" border="0" cellpadding="0" cellspacing="5">
      <tr>
        <td width="20%" align="left" valign="top"><iframe name="I1" height="680" width="100%" src="/shopping/users/left.jsp" border="0" frameborder="0" scrolling="no"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
        <td width="80%" align="left" valign="top"><iframe name="right" height="680" width="100%" src="/shopping/users/test.jsp" border="0" frameborder="0" scrolling="no"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
      </tr>
    </table>
    <div style="width:980px; margin:0px auto;">
    <div id="bot">
       	  <div id="we">
            	<a href="#">关于我们</a> – 
                <a href="#">帮助中心</a> – 
                <a href="#">配送方式</a> – 
                <a href="#">支付方式</a> – 
                <a href="#">客服中心</a> – 
                <a href="#">友情链接</a> – 
                <a href="#">诚聘英才</a> – 
                <a href="#">产品招商</a> – 
                <a href="#">送礼指南</a> – 
                <a href="#">网站地图</a> 
          </div>
          <div id="info">
           	  <p>Copyright © <a href="../front/index.html">Gogo</a> 2012-2016, All Rights Reserved</p>
              <p>地址：广东省中山市</p>
              <p>Tel: (0756) 888888 Fax: (0756) 8888888  Email:xxxxxxx@qq.com</p>
              <p>本网站版权所属xxxx</p>
              <hr />
              <p style="color:#CC3300">Gogo商城与国内知名支付平台合作,确保您的交易安全! </p>
              <img src="/shopping/images/index/boot_01.jpg" />
              <img src="/shopping/images/index/boot_02.jpg" />
              <img src="/shopping/images/index/boot_03.jpg" />
              <img src="/shopping/images/index/boot_04.jpg" />
              <img src="/shopping/images/index/logo123x40.jpg" />
        </div>
  </div>
</div></td>
  </tr>
</table>
</body>
</html>
