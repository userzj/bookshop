<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加管理员</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css1/style.css" type="text/css" media="all" />
  </head>
  
  <body>
  <div class="table">
					<form action="addAdmin.action" method="post" enctype="multipart/form-data">
				    	<table border="1" align="center">
				    		<tr>
				    			<td>管理员用户名</td>
				    			<td>
				    				<input type="text" name="AdminUname"/>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>密码</td>
				    			<td>
				    				<input type="password" name="AdminPwd"/>
				    			</td>
				    		</tr>
				    		
				    			
				    		<tr>
				    		
				    			
				    			<td colspan="2">
				    				<input type="submit" value="提交"/>
				    			</td>
				    		</tr>
				    	
				    	</table>
				    
				    </form>
						
						
						
						
					</div>
					<!-- Table -->
					
  </body>
</html>
