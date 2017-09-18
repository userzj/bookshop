<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单详情</title>
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
    .xinxi1{padding:15px;}
	.xinxi1 div p{margin:8px 14px;}
	.xinxi1 div p span{margin-right:5px;}
	#ForderGood{border:1px solid #cccccc; margin:15px; margin-bottom:0px; padding:15px;}
	#ForderGood table td{
		height:25px; 
		text-align:center;
		line-height:25px;
		border-bottom:1px solid #E5E5E5;}
	#ForderGood #monery p{
		text-align:right;
		margin-top:10px;
		margin-right:5px;
</style>
</head>

<body>
<div id="right" style="width:780px; margin-bottom:10px;">
        	<div style="background-image:url(/shopping/images/users/xiangxi-center-top.jpg);background-repeat:repeat-x;height:8px;clear:both">
                	<img style="float:left" src="/shopping/images/users/xiangxi-left-top.jpg" />
                    <img style="float:right" src="/shopping/images/users/xiangxi-right-top.jpg" />
                    <div style="clear:both"></div>
            </div>
            <div style="background-image:url(/shopping/images/users/Snap5.jpg);background-repeat:repeat-y;padding-bottom:30px;">
			<!-- 显示订单的收货信息 -->
                   <div class="xinxi1">
                        <div>
                        	<h1 style="border-bottom:2px solid #cccccc; font-size:14px">订单收货信息</h1>
                            <p><span>订 单 号：</span>${requestScope.forder.fid }</p>
                            <p><span>收 货 人：</span>${requestScope.forder.uname }</p>
                            <p><span>联系电话：</span>${requestScope.forder.uphone }</p>
                            <p><span>收货人地址：</span>${requestScope.forder.uaddress }</p>
                            <p><span>邮政编码：</span>${requestScope.forder.upost }</p>
                        </div>
                   </div>
                   <!-- 显示订单详情 -->
                   <div class="xinxi1">
                        <div>
                        	<h1 style="border-bottom:2px solid #cccccc; font-size:14px">订单详情</h1>
                            <p><span>订单生成时间：</span>${requestScope.forder.fdate }</p>
                            <p><span>送货要求：</span>${requestScope.forder.fremark }</p>
                            <p><span>订单状态：</span>${requestScope.forder.status.status }</p>
                            <p><span>客服人员：</span>
                            <c:choose>
                            	<c:when test="${requestScope.forder.account==null}">暂无</c:when>
                            	<c:otherwise>${requestScope.forder.account.alogin}</c:otherwise>
                            </c:choose>
                            </p>
                        </div>
                   </div>
                   <!-- 显示订单清单 -->
                   <div id="ForderGood">
                        <div>
                        	<h1 style="font-size:14px; margin-bottom:10px;">商品清单</h1>
                            <table width="100%" cellspacing="0" cellpadding="0" style="border:1px solid #E5E5E5">
                            	<tr>
                                	<td style="background-color:#7B7F8A;color:#FFFFFF;width:110px;">商品编号</td>
                                    <td style="background-color:#7B7F8A;color:#FFFFFF">商品名称</td>
                                    <td style="background-color:#7B7F8A;color:#FFFFFF;width:90px;">单位</td>
                                    <td style="background-color:#7B7F8A;color:#FFFFFF;width:90px;">数量</td>
                                    <td style="background-color:#7B7F8A;color:#FFFFFF;width:90px;">单价${requestScope.forder.sorders[0].gname}</td>
                                </tr>
                                <!-- 这里显示订单详细里面的一个商品 -->
                                <c:forEach items="${requestScope.forder.sorders}" var="sorder">
	                                <tr>
	                                	<td>${sorder.good.gid }</td>
	                                    <td>${sorder.gname }</td>
	                                    <td>件</td>
	                                    <td>${sorder.gnumber }</td>
	                                    <td>${sorder.gprice }</td>
	                                </tr>
                                <!-- 这里显示订单详细里面的一个商品 结束 -->
                                </c:forEach>
                            </table>
                            <div id="monery">
                            	<p>商品金额合计：${requestScope.forder.ftotal }元</p>
                               
                                <p style="color:#990000; font-size:14px">应收款金额：${requestScope.forder.ftotal}元</p>
                            </div>
                        </div>
                   </div>
                   <!-- 显示订单清单结束 -->
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

