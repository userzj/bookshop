<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body class="sub">
<br />
<form action="adminLogin.action" method="post" name="form1" id="form1">
  <table width="100%" border="0" cellspacing="0" cellpadding="1" class="TitleColor">
    <tr style="vertical-align: top">
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr class="HeaderColor">
            <td width="40%" style="vertical-align: top">&nbsp;</td>
            <td width="20%" style="vertical-align: top">              <h3>管理员登录</h3>            </td>
            <td width="40%" style="vertical-align: top">              <h3>&nbsp;</h3>            </td>
          </tr>
          <tr style="vertical-align: top">
            <td width="20%" class="TitleColor">&nbsp;</td>
            <td width="20%" class="TitleColor">
              <label for="username"><strong>用户名</strong></label>
              ${wrongMessage}
              <br />
              <input id="username" name="username" type="text" size="25" />
              <p>&nbsp;</p>
              <label for="password"><strong>密码</strong></label>&nbsp;<br />
              <input id="password" name="password" type="password" size="25" />
              <p>
                <input type="submit" name="ButtonName" value="登录" />
                <input type="reset" value="清空" />
              </p>            </td>
            <td width="80%" class="StoryContentColor">
              <h4 class="TitleColor">&nbsp;</h4>
              </td>
          </tr>
        </table>      </td>
    </tr>
  </table>
</form>
</body>
</html>
