<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <meta http-equiv="refresh" content="0;url=<%=path%>/mainsy/MainIndex.do"> 
  </head>
  
  <body>
    	<!-- <h1 style="margin-top: 200px;margin-left: 400px;">为您提供最好的服务，让您获得更多的收益</h1><br>
    	<h3 style="margin-left: 800px;">------欢迎来到返利网</h3> -->
    
  </body>
</html>
