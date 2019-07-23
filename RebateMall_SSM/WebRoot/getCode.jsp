<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String code = request.getParameter("code");
	String sessionCode = session.getAttribute("code").toString();
	if(code.equals(sessionCode)){
		out.print("验证码填写正确！");
	}else{
		out.print("验证码填写错误！");
	}
%>
