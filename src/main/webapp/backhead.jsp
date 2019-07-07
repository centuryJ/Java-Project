<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

</head>
<body>
	<div id="head">
		<div id="login">当前登录的账号: ${sessionScope.emp.name }和真实姓名:${sessionScope.emp.realname }</div>
	</div>
</body>
</html>