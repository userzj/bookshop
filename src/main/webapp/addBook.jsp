<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加图书</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css1/style.css" type="text/css" media="all" />

  </head>
  
  <body>

					<div class="table">
					<form action="addbooks.action" method="post" enctype="multipart/form-data">
				    	<table border="1" align="center">
				    		<tr>
				    			<td>书名</td>
				    			<td>
				    				<input type="text" name="bookname"/>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>分类</td>
				    			<td>
				    				<select id = "bookclass"  name = "bookclass">
    								<option value =1 >教育</option>
    								<option value =2 >小说</option>
    								<option value =3 >文艺</option>
    								<option value =4 >青春</option>
    								<option value =5 >童书</option>
    								<option value =6 >生活</option>
    								<option value =7>人文社科</option>
    								<option value =8 >经管</option>
    								<option value =9 >励志</option>
    								<option value =10 >科技</option>
    								<option value =11 >工具书</option>
    								<option value =12 >期刊</option>
    								<option value =13 selected>其它</option>
    			</select>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>作者</td>
				    			<td>
				    				<input type="text" name="author"/>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>出版社</td>
				    			<td>
				    				<input type="text" name="publish"/>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>书号</td>
				    			<td>
				    				<input type="text" name="bookno"/>
				    			</td>
				    		</tr>
				    		
				    		<tr>
				    			<td>简介</td>
				    			<td>
				    				<input type="text" name="content"/>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>价格</td>
				    			<td>
				    				<input type="text" name="price"/>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>购进數量</td>
				    			<td>
				    				<input type="text" name="amount"/>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>库存</td>
				    			<td>
				    				<input type="text" name="leavNumber"/>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>封面</td>
				    			<td>
				    				<input type="file" name="picture"/>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>引进时间</td>
				    			<td>
				    				<input type="text" name="regTime"/>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>状态</td>
				    			<td>
				    				 <input type = "radio"  name="status" value = 1 checked="checked"/>上架
                 					 <input type = "radio"  name="status" value = 0/>下架
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

