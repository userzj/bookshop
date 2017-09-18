<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户订单显示</title>
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
<style type="text/css">
	.bg1{background-color:#ffffff}
	.bg{background-color:#E8F6FF}
	.click{background-color:#ccffff}
</style>
<script type="text/javascript" src="/shopping/js/public.js"></script>
<script type="text/javascript" src="/shopping/js/jquery.js"></script>
<script type="text/javascript">
	$("document").ready(function(){
		$(".annul").click(function (){
			if(confirm("您确定要取消此订单吗???")){
				var fid=$(this).attr("id");
				var self = this;
				$.get(formartURL("/shopping/forder.do?status=updStatus&fid=" + fid +"&sid=5"),null,function(){
					$(self).parent().next().html("<span style='color:#000000;text-decoration:line-through;'>无效订单</span>");
					$(self).parent().prev().prev().html("废单");
					$(self).parent().html("<span style='color:#000000;text-decoration:line-through;'>取消订单</span>");
				});
			}
		});
		$(".affirm").click(function (){
			$(this).attr("style","text-decoration:line-through;");
			var fid=$(this).attr("id");
			$.get(formartURL("/shopping/forder.do?status=updStatus&fid=" + fid +"&sid=4"),null,function(){
			
			});
		});
		
	});
</script>
</head>

<body>
<div id="right" style="width:780px; margin-bottom:10px;">
        	<div style="background-image:url(/shopping/images/users/xiangxi-center-top.jpg);background-repeat:repeat-x;height:8px;clear:both">
                	<img style="float:left" src="/shopping/images/users/xiangxi-left-top.jpg" />
                    <img style="float:right" src="/shopping/images/users/xiangxi-right-top.jpg" />
                    <div style="clear:both"></div>
            </div>
            <div style="background-image:url(/shopping/images/users/Snap5.jpg);background-repeat:repeat-y;padding-bottom:30px;">
			<div id="xinxi">
                   		<!-- 会员的基本信息 -->
                   		<div style="border-bottom:1px dashed #cccccc">
                        	<p>您目前的会员级别是：<b style="color:#990000; font-size:12px">普通会员</b></p>
                            <p>截止到现在，你目前已有<b style="color:#990000;font-size:12px;margin:0px 3px;">${sessionScope.fordernum }</b>张订单完成交易</p>
                            <p>累计消费<b style="color:#990000;font-size:12px;margin:0px 3px;">${sessionScope.total }</b>元</p>
                        </div>
                    	<!-- 会员的基本信息结束 -->
                      <c:if test="${requestScope.forders!=null}">
                        <div>
                        	<h1 style="border-bottom:2px solid #cccccc; margin:20px 0px; font-size:14px">所有订单</h1>
                            <table width="100%" cellspacing="0" cellpadding="0" style="border:1px solid #E5E5E5" id="shuju">
                            	<tr>
                                	<td style="background-color:#F9F9F9; width:118px; height:28px;">订单号</td>
                                    <td style="background-color:#F9F9F9; width:218px; height:28px;">收货人</td>
                                    <td style="background-color:#F9F9F9; width:65px; height:28px;">总价</td>
                                    <td style="background-color:#F9F9F9; width:88px; height:28px;">订单状态</td>
                                    <td style="background-color:#F9F9F9; width:88px; height:28px;">订单详情</td>
                                    <td style="background-color:#F9F9F9; width:88px; height:28px;">操作</td>
                                    <td style="background-color:#F9F9F9; width:88px; height:28px;">去支付</td>
                                </tr>
                                <!-- 一个订单的基本信息 最多循环10次-->
                               <c:forEach items="${requestScope.forders}" var="forder">
                                <tr id="${forder.fid }">
                                	<td>${forder.fid}</td>
                                    <td>${forder.uname}</td>
                                    <td>${forder.ftotal}</td>
                                    <td>${forder.status.status }</td>
                                    <td>
                                    <a href="/shopping/users.do?status=detailForder&fid=${forder.fid}" style="color:#000000">查看订单详情</a></td>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${forder.status.sid==1}">
                                    			  <a style="color:#000000" class="annul" id="${forder.fid}">取消订单</a>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<span style="color:#000000;text-decoration:line-through;">取消订单</span>
                                    		</c:otherwise>
                                    	</c:choose>
                                  </td>
                                  <td><c:choose>
                                    		<c:when test="${forder.status.sid==1}">
                                    			  <a href="/shopping/forder.do?status=payForder&fid=${forder.fid}" target="_parent" style="color:#000000">去支付</a>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<c:choose>
		                                    		<c:when test="${forder.status.sid!=5}">
		                                    			  <c:choose>
				                                    		<c:when test="${forder.status.sid!=4}">
				                                    			  <a href="" style="color:#000000" class="affirm" id="${forder.fid}">确认收货</a>
				                                    		</c:when>
				                                    		<c:otherwise>
				                                    			<span style="color:#000000;text-decoration:line-through;">交易完成</span>
				                                    		</c:otherwise>
				                                    	</c:choose>
		                                    		</c:when>
		                                    		<c:otherwise>
		                                    			<span style="color:#000000;text-decoration:line-through;">无效订单</span>
		                                    		</c:otherwise>
		                                    	</c:choose>
                                    		</c:otherwise>
                                    	</c:choose>
                                </td>
                                </tr>
                                </c:forEach>
                                <!-- 一个订单的基本信息结束 -->
                                <tr>
                                	<td colspan="7" style="text-align:right; padding-right:20px;background-color:#FFFFFF">
                                    	<span style="margin:0px 5px;">
                                        	共<b style="color:#999999;font-size:12px;margin:0px 3px;">${sessionScope.countPage}</b>页</span>
                                        <span style="margin:0px 5px;">每页显示 5 条</span>
                                         <span style="margin:0px 5px;">目前显示第${sessionScope.currentPage}页</span>
                                        <span style="margin:0px 5px;">
                                        <c:choose>
                                        	<c:when test="${sessionScope.currentPage>1}">
                                        		<a href="/shopping/users.do?status=otherForder&currentPage=1">首页</a>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<a>首页</a>
                                        	</c:otherwise>
                                        </c:choose>
                                        </span>
                                        <span style="margin:0px 5px;"> <c:choose>
                                        	<c:when test="${sessionScope.currentPage>1}">
                                        		<a href="/shopping/users.do?status=otherForder&currentPage=${sessionScope.currentPage-1}">上一页</a>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<a>上一页</a>
                                        	</c:otherwise>
                                        </c:choose></span>
                                        <span style="margin:0px 5px;"> <c:choose>
                                        	<c:when test="${sessionScope.currentPage<sessionScope.countPage}">
                                        		<a href="/shopping/users.do?status=otherForder&currentPage=${sessionScope.currentPage+1}">下一页</a>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<a>下一页</a>
                                        	</c:otherwise>
                                        </c:choose></span>
                                        <span style="margin:0px 5px;"> <c:choose>
                                        	<c:when test="${sessionScope.currentPage!=sessionScope.countPage}">
                                        		<a href="/shopping/users.do?status=otherForder&currentPage=${sessionScope.countPage}">尾页</a>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<a>尾页</a>
                                        	</c:otherwise>
                                        </c:choose></span>
                                    </td>
                                </tr>                          
                            </table>
                        </div>
                        </c:if>
                        <c:if test="${requestScope.forders==null}">
                        	<div style="padding-top:30px;padding-left:20px;">您还没有生成任何订单,返回<a href="/shopping/index.jsp" style="padding-left:20px; color:#ff0000;" target="_parent">Gogo购物商城首页</a></div>                        
                        </c:if>
                   </div>
				   <div style="clear:both"></div>
            </div>
            <div style="background-image:url(/shopping/images/users/xiangxi-center-bot.jpg);background-repeat:repeat-x;height:8px;clear:both">
                	<img style="float:left" src="/shopping/images/users/xiangxi-left-bot.jpg" />
                    <img style="float:right" src="/shopping/images/users/xiangxi-right-bot.jpg" />
                    <div style="clear:both"></div>
            </div>
        </div>
</body>
</html>

