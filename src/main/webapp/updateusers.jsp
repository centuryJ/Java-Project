<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.emp==null}">
	<c:redirect url="backlogin.jsp"/>
</c:if>
<form action="updateusersserverlet" method="post">
	<table border="1">
		<tr>
			<td>编号</td>
			<td><input type="text" name="id" value="${requestScope.users.id }" readonly/></td>
		</tr>
		<tr>
			<td>用户名称</td>
			<td><input type="text" name="username" value="${requestScope.users.username }"/></td>
		</tr>
		<tr>
			<td>密码</td>
			<td><input type="text" name="password" value="${requestScope.users.password }"/></td>
		</tr>
		<tr>
			<td>真实姓名</td>
			<td><input type="text" name="realname" value="${requestScope.users.realname }"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="修改" /></td>
		</tr>
	</table>
</form>
</body>
</html>