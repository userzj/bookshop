<%@ page language="java" import="java.util.*,cn.com.zj.pojo.Book" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改书籍信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
	<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>
  </head>
  
  <body>
   <%
  Book book  = (Book)request.getAttribute("book1");
    	%>
   <form action="updateABook.action?id=<%=book.getId() %>"  method="post" enctype="multipart/form-data">
   <div class="bs-docs-example">
            <table class="table">
              <thead>
                <tr>
                  
                  <th>書名</th>
                  <th>分類</th>
                  <th>作者</th>
                  <th>出版社</th>
                  <th>書號</th>
                  <th>介紹</th>
                  <th>價格</th>
                  <th>购进數量</th>
                  <th>库存</th>
                  <th>封面</th>
                  <th>引進時間</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td> <input type = "text" name="bookname" value = " <%= book.getBookname() %>" /> </td>
                  <td><input type = "text"  name="bookclass" value = "<%=book.getBookclass() %>"/></td>
                  <td><input type = "text"  name="author" value = "<%=book.getAuthor() %>"/></td>
                  <td><input type = "text"  name="publish" value = "<%=book.getPublish() %>"/></td>
                   <td><input type = "text" name="bookno" value = "<%=book.getBookno() %>"/></td>
                  <td><input type = "text"  name="content" value = "<%=book.getContent() %>"/></td>
                  <td><input type = "text"  name="price" value = "<%=book.getPrice() %>"/></td>
                  <td><input type = "text"  name="amount" value = "<%=book.getAmount() %>"/></td>
                  <td><input type = "text"  name="leavNumber" value = "<%=book.getLeavNumber() %>"/></td>
                  <td><input type="file" name="picture" value = ""/></td>
                  <td><input type = "text"  name="regTime" value = "<%=book.getRegTime() %>"/></td>
                  
                </tr>
               
              </tbody>
            </table>
          </div>
  			<div class="col-sm-6 newsright">
				
					<input type="submit" value="提交">
						
			</div>
  
  
  </form>
  </body>
</html>
