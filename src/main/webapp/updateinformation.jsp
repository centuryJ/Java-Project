<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- 引入jstl --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<!-- 没有登录emp的值为null -->
<c:if test="${sessionScope.emp==null}">
	<c:redirect url="backlogin.jsp"/>
</c:if>

<form action="updateInfoServlet" method="post">
<table border="1">
	<tr>
		<td>编号</td><td><input type="text" value="${info.id }"  name="id" readonly/></td>
	</tr>
	<tr>
		<td>标题</td><td><input type="text" value="${info.title }" name="title"/></td>
	</tr>
	<tr>
		<td>时间</td><td><input type="text" value="${info.time }" name="time"/></td>
	</tr>
	<tr>
		<td>正文</td><td><input type="text" value="${info.context }" name="context"/></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="修改"/></td>
	</tr>
</table>
</form>

</body>
</html>