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
<form action="addnewsservlet" method="post">
	标题<input type="text" name="title">
<!--(使用java代码获取当前时间) 	时间<input type="text" name="time"> -->
	正文<input type="text" name="context">
	<input type="submit" value="添加">
</form>

</body>
</html>