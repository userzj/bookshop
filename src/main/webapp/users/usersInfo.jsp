<%@ page language="java"  pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="/shopping/css/index/index.css" rel="stylesheet" type="text/css" />
<link href="/shopping/css/users/usersInfo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/shopping/js/area.js"></script>
<script type="text/javascript" src="/shopping/js/validate/jquery.js"></script>
<script type="text/javascript" src="/shopping/js/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/shopping/js/user/usersInfo.js"></script>
</head>

<body>
 <div id="right" style="width:780px; margin-bottom:10px;">
        	<div style="background-image:url(/shopping/images/users/xiangxi-center-top.jpg);background-repeat:repeat-x;height:8px;clear:both">
                	/<img style="float:left" src="/shopping/images/users/xiangxi-left-top.jpg" />
                    <img style="float:right" src="/shopping/images/users/xiangxi-right-top.jpg" />
                    <div style="clear:both"></div>
            </div>
            <div style="background-image:url(/shopping/images/users/Snap5.jpg);background-repeat:repeat-y;padding-bottom:30px;">
			 <div id="xinxi">
               	  	 		<h1 style="border-bottom:2px solid #cccccc;">
                                <span style="border-bottom:2px solid #FF0000;font-size:14px">编辑个人资料</span>
                   	 		</h1>
                            <p>帮助我们完善您的个人信息，有助于我们未来根据您的情况提供更加个性化的服务；Gogo商城会对您的个人隐私资料加以保密。</p>
                     		<form action="/shopping/users.do" method="post" name="myform" id="myform">
                                <div class="bo">
                                	<label>真实姓名：</label>
                                	<input type="text"size="20" name="uname" id="uname" maxlength="10" value="${sessionScope.users.uname}" />
                                </div>
                                <div class="bo">
                               	  	<label>手机号码：</label>
                                	<input type="text" size="20" name="uphone" id="uphone" maxlength="16" value="${sessionScope.users.uphone}"/>
                                </div>
                              	<div class="bo">
                               		<label>电子邮件：</label>
                                	<input type="text" size="30" name="uemail" id="uemail" maxlength="20" value="${sessionScope.users.uemail}" />
                                	<span></span>
                              	</div>
                              	<div class="bo">
                                	<label>所在省市：</label>
                                	<c:forTokens items="${sessionScope.users.uaddress}" delims="-" var="select" varStatus="num">
                                		<c:if test="${num.count==1}" ><c:set  var="selectp" value="${select}"/></c:if>
                                		<c:if test="${num.count==2}" ><c:set  var="selectc" value="${select}"/></c:if>
                                		<c:if test="${num.count==3}" ><c:set  var="uaddress" value="${select}"/></c:if>
                                	</c:forTokens>
                               		<select name=selectp id="selectp" onchange="selectcityarea('selectp','selectc','myform');">
                               			<option selected id="index" value="${selectp}">${selectp}</option>
                                	</select>
                                    <select name=selectc><option selected id="default" value="${selectc}">${selectc}</option></select>
                                    
                              	</div>
                              	<div class="bo">
                                	<label>详细地址：</label>
                                	<input type="text" size="30" name="uaddress" id="uaddress" maxlength="10" value="${uaddress}"/>
                                	<span></span>
                              	</div>
                              	<div class="bo">
                                	<label>邮政编码：</label>
                                	<input type="text" size="30" name="upost" id="upost" maxlength="10" value="${sessionScope.users.upost}"/>
                                	<span></span>
                              	</div>
                                <div class="bo">
                                	<input type="submit" id="sub" value="保存" />
                                	<input type="reset" id="sub" onclick="javascript:window.open('/shopping/users/test.jsp','_self')" value="取消" />
                                	<input type="hidden" name="status" value="updUsers" />
                                	<input type="hidden" name="uid" value="${sessionScope.users.uid}"/>
                              	</div>
                     </form>
                   </div>
                   <script language=javascript>
						first("selectp","selectc","myform",0,0);
        		   </script>
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

