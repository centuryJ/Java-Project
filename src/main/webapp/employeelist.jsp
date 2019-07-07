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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.emp==null}">
	<c:redirect url="backlogin.jsp"/>
</c:if>
<table border="1">
	<tr>
		<td>员工编号</td>
		<td>员工名称</td>
		<td>员工密码</td>
		<td>真实姓名</td>
		<td>操作</td>
	</tr>
	<c:forEach items="${requestScope.employees }" var="employee">
		<tr>
			<td>${employee.id }</td>
			<td>${employee.name }</td>
			<td>${employee.password }</td>
			<td>${employee.realname }</td>
			<td><a href="deleteemployeeservlet?eid=${employee.id }">删除</a>
			    <a href="preupdateemployeeservlet?eid=${employee.id }">修改</a>
			</td>
		</tr>
	</c:forEach>


</table>


</body>
</html>