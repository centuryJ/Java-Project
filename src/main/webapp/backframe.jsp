<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
</head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.emp==null}">
	<c:redirect url="backlogin.jsp"/>
</c:if>

<frameset rows="100,*,30" frameborder="yes" border="1" framespacing="0" >
  <frame src="backhead.jsp" name="topFrame" scrolling="NO" noresize class="dis">
  <frameset cols="180,*" frameborder="yes" border="1" framespacing="0" >
		<frame src="backmenu.jsp" name="menuFrame"  scrolling="no" noresize >
		<frame src="" name="mainFrame" marginheight="2" marginwidth="2" scrolling="no">
	</frameset>
  <frame src="backbottom.jsp" name="bottomFrame" scrolling="NO" noresize>
</frameset>

<noframes><body></body></noframes>
</html>
