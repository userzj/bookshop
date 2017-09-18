<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/geo.js"></script>
  </head>
  
  <body onload="setup();preselect('省份');promptinfo();">
        <form>
            <select class="select" name="province" id="s1">
              <option></option>
            </select>
            <select class="select" name="city" id="s2">
              <option></option>
            </select>
            <select class="select" name="town" id="s3">
              <option></option>
            </select>
            <input id="address" name="address" type="hidden" value="" />
          <input onclick="alert(document.getElementById('address').value); return false;" type="submit" value="提交" />
        </form>
<script>

//这个函数是必须的，因为在geo.js里每次更改地址时会调用此函数
function promptinfo()
{
    var address = document.getElementById('address');
    var s1 = document.getElementById('s1');
    var s2 = document.getElementById('s2');
    var s3 = document.getElementById('s3');
    address.value = s1.value + s2.value + s3.value;
}

</script>
</body>
</html>
