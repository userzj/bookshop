<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Gogo商场,享受无限经典</title>
<link href="/shopping/css/index/index.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	* {
		margin:0px;
		font-size:12px;
		color:#666666;
	}
</style>
<style type="text/css">
	* {
		margin:0px;
		font-size:12px;
		color:#666666;
	}
	#xuanzhi span{margin-left:6px;}
	#digouren div{margin:10px 0px;}
	#showCar{background-color:#F0F0F0; border:1px solid #D5D5D5; margin-left:10px; margin-top:10px;}
	#showCar div{background-color:#FFFFFF; border:1px solid #D5D5D5; padding:10px;}
	#showCar table{border:1px solid #D5D5D5;}
	#showCar table tr td{
		border-bottom:1px solid #D5D5D5;
		/*border-right:1px solid #D5D5D5;*/
		text-align:center;
		height:50px;}
	#showCar #title td{height:20px; color:#000000; font:bold}
	#showCar .ftotal{
		margin-top:10px; 
		text-align:right; 
		padding-right:50px;
		font-size:14px; 
		font:bold; 
		color:#FF0000
	}
	#diz span{
		padding-right:8px;
		color:#ff0000;
	}
	#showCar #sub{background-image:url(/shopping/images/car/buy.jpg); width:140px; height:28px; border:0px;}
</style>
<script type="text/javascript" src="/shopping/js/jquery.js"></script>
<script type="text/ecmascript" src="/shopping/js/area.js"></script>
<script charset="utf-8" type="text/ecmascript" src="/shopping/js/lookup.js"></script>
<script type="text/javascript">
	$(document).ready(function (){
		$(".dizhi").mouseover(function (){
			$(this).css("background-color","#FEF2CA");
		}).mouseout(function(){
			$(this).css("background-color","#ffffff");
		});
		$("#otherAdd").click(function (){
			lockup("/shopping/users/lastConfirm.jsp");
			$("#otherAdd").removeAttr("checked");
			$("#baseAdd").attr("checked","checked");
		});
	});
</script>
</head>

<body>
<c:if test="${sessionScope.forder.ftotal==null || sessionScope.forder.ftotal==''}">
		<%
			request.getRequestDispatcher("/users/showCar.jsp").forward(request,response);
		 %>
	</c:if>
<div style="width:980px; margin:0px auto;">
  <div id="top">
    	<div id="con">
        	<span class="c" style="padding-left:30px;"><a href="/shopping/index.jsp">Gogo首页</a></span>
            <span>|</span>
            <span class="c"><a href="/shopping/users/showCar.jsp">我的购物车</a></span>
             <span>|</span>
            	<span class="c"><a href="/shopping/users/main.jsp">我的Gogo</a></span>
            <span style="margin-left:40px;">${sessionScope.users.ulogin}欢迎光临Gogo商城！</span>
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
                <form action="/shopping/good.do" method="post" id="queFrom">
                    <input id="text" type="text" name="gname" />
                    <input id="submit" type="image" src="/shopping/images/index/top_line2_search_02.gif" />
                    <input type="hidden" name="status" value="queGoodByGname"/>
              	</form>
            </div>
           <div id="car">
            	<img style="float:left" src="/shopping/images/index/shop-left.jpg" />
                <img style="float:right" src="/shopping/images/index/shop-right.jpg" />
                <span style="color:#000000; margin-left:10px;">购物车:</span>
                <span style="color:#FF0000; font:bold">
	                		  <c:choose>
	                		<c:when test="${sessionScope.goodnum==null}">0</c:when>
	                		<c:otherwise>${sessionScope.goodnum}</c:otherwise>
	                	</c:choose>
									</span>件商品
                <span style="margin-left:15px;"><a href="/shopping/users/showCar.jsp" style="color:#FF0000;">去结算</a>
                </span>
           	</div>
      	</div>
      	<div id="menu">
      		<img style="float:left" src="/shopping/images/index/menu-l.gif" />
        	<img style="float:right" src="/shopping/images/index/menu-r.gif" />
            <ul>
       		  	<li><a href="/shopping/index.jsp"><b>首页</b></a></li>
               <c:forEach items="${applicationScope.goodlist}" var="list">
							<li>
								<a href="#" class="c"><b>${list[0].category.ctype}</b> </a>
							</li>
							<li class="img">
								<img style="float: left;" src="/shopping/images/index/split.jpg" />
							</li>
						</c:forEach>
        	</ul>
    	</div>
  </div>

    <div id="mid" style="margin-bottom:20px;">
    	<div style="margin:30px 0px; ">
        	<img src="/shopping/images/car/navigation2.jpg" />
        </div>
        	<div>
            	<div style="margin-left:8px;"><b style="color:#333333">订购人信息</b></div>
                <div style="margin:20px 0px; margin-left:8px; border:1px solid #cccccc" id="digouren">
                	<div class="dizhi" style="padding:3px 0px; padding-left:45px;">
                    	<span style="margin-right:10px;">真实姓名：</span><span>${sessionScope.users.uname}</span>
                    </div>
                    <div class="dizhi" style="padding:3px 0px; padding-left:45px;">
                    	<span style="margin-right:10px;">通讯地址：</span><span>${sessionScope.users.uaddress }</span>
                    </div>
                    <div class="dizhi" style="padding:3px 0px; padding-left:45px;">
                    	<span style="margin-right:10px;">通讯电话：</span><span>${sessionScope.users.uphone }</span>
                    </div>
                    <div class="dizhi" style="padding:3px 0px; padding-left:45px;">
                    	<span style="margin-right:10px;">电子邮件：</span><span>${sessionScope.users.uemail }</span>
                    </div>
                </div>
            </div>
        	<div>
            	<div style="margin-left:8px;"><b style="color:#333333">确认收货地址</b></div>
                <div style="margin-top:20px; margin-left:8px; padding:10px 0px; border:1px solid #cccccc" id="xuanzhi">
                	<div class="dizhi" id="diz" style="padding-left:45px;">
                		<input type="radio" name="dizhi" checked="checked" id="baseAdd"/>
                    	<c:choose>
                    		<c:when test="${param.uname=='' || param.uname== null }">
                    			<label>收货人：</label><span>${sessionScope.users.uname }</span><label>电话:</label><span> ${sessionScope.users.uphone }</span><label>送货地址: </label><span>${sessionScope.users.uaddress}</span><label>邮政编码:</label><span>${sessionScope.users.upost }</span>
                    		</c:when>
                    		<c:otherwise>
                    			<label> 收货人：</label><span>${param.uname }</span><label>电话:</label> <span>${param.uphone }</span><label>送货地址: </label><span>${param.selectp}-${param.selectc}-${param.gxremark}</span><label>邮政编码:</label><span>${param.upost }</span>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                    <div class="dizhi" style="margin-top:10px; padding-left:45px;">
                    	<input type="radio" name="dizhi" value="" id="otherAdd" />
                    	<span>如果未选择正确的送货地址，我们将按照您的注册时的默认地址发货</span>
                    </div>
                </div>
            </div>
            <div>
            	<div style="margin-left:8px; margin-top:40px;"><b style="color:#333333">确认订单信息</b></div>
                <div id="showCar">
            		<div>
            			<table width="100%" cellspacing="0" cellpadding="0">
                			<tr id="title">
                				<td width="100">商品编号</td>
                                <td width="370">商品名称</td>
                      			<td width="90">销售价格</td>
                      			<td width="100">数量</td>
                      			<td width="80">小计</td>
                    		</tr>
                            <!-- 这里显示购物车里面的一个商品 -->
                            <c:forEach items="${sessionScope.forder.sorders}" var="sorder">
                            	<tr>
                            		<td>${sorder.good.gid }</td>
                            		<td >${sorder.gname }</td>
	                                <td>${sorder.gprice }</td>
	                                <td>${sorder.gnumber }</td>
	                                <td>${sorder.gprice * sorder.gnumber}</td>
                            	</tr>
                            </c:forEach>
                        </table>
                    </div>
                	<div class="ftotal">商品总价:￥${sessionScope.forder.ftotal}</div>
                    <form action="/shopping/forderAction_savefoder.action" method="post">
                    <div style="margin-top:10px;">
                    	<b style="color:#333333; font-size:12px; float:left; margin-right:5px;">给卖家留言:</b>
                        <textarea name="fremark" cols="60" rows="2" ></textarea>
                   	</div>
                    <div class="ftotal">
	                    	<c:choose>
	                    		<c:when test="${param.uname=='' || param.uname==null }">
		                    		<input type="hidden" name="forder.uaddress" value="${sessionScope.users.uaddress }" />
			                    	<input type="hidden" name="forder.uname" value="${sessionScope.users.uname }" />
			                    	<input type="hidden" name="forder.uphone" value="${sessionScope.users.uphone }" />
			                    	<input type="hidden" name="forder.uemail" value="${sessionScope.users.uemail }" />
			                    	<input type="hidden" name="forder.upost" value="${sessionScope.users.upost}" />
	                    		</c:when>
	                    		<c:otherwise>
		                    		<input type="hidden" name="forder.uaddress" value="${param.selectp}-${param.selectc}-${param.gxremark}" />
			                    	<input type="hidden" name="forder.uname" value="${param.uname }" />
			                    	<input type="hidden" name="forder.uphone" value="${param.uphone }" />
			                    	<input type="hidden" name="forder.uemail" value="${param.uemail }" />
			                    	<input type="hidden" name="forder.upost" value="${param.upost}" />
	                    		</c:otherwise>
	                    	</c:choose>
	                      	<input type="submit" id="sub" value=" " />
                    </div>
                    </form>
       		  </div>
            </div>
    </div>
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
</div>
</body>
</html>
