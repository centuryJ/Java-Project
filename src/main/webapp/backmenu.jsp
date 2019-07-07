<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<META http-equiv=Pragma content=no-cache>
<META http-equiv=Cache-Control content=no-cache>
<META http-equiv=Expires content=-1000>
<style>
	a{
		text-decoration: none;
	}

</style>
<SCRIPT language=javascript>
	function expand(el) {
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none') {
			childObj.style.display = 'block';
		} else {
			childObj.style.display = 'none';
		}

		return;
	}
</SCRIPT>
</HEAD>
<BODY>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.emp==null}">
	<c:redirect url="backlogin.jsp"/>
</c:if>
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width=170
		 border=0 >
		<TBODY>
			<TR>
				<TD vAlign=top align=center>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD height=10></TD>
							</TR>
						</TBODY>
					</TABLE>
 					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
						<TBODY>
							<TR height=22>
								<TD style="PADDING-LEFT: 30px" ><A
									class=menuParent onclick=expand(1) href="javascript:void(0);">员工管理</A>
								</TD>
							</TR>
							<TR height=4>
								<TD></TD>
							</TR>
						</TBODY>
					</TABLE>
					
					<TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0
						width=150 border=0>
						<TBODY>
							<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									href="employeelisserverlet" target="mainFrame">&nbsp;<font size=2>查看员工</font></A>
								</TD>
							</TR>

							<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									onclick="javascript:window.close();"
									href="searchemployeeServlet" target=mainFrame>&nbsp;<font size=2>查询员工</font></A>
								</TD>
							</TR>
							

							<TR height=4>
								<TD colSpan=2></TD>
							</TR>
						</TBODY>
					</TABLE>
					
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
						<TBODY>
							<TR height=22>
								<TD style="PADDING-LEFT: 30px" ><A
									class=menuParent onclick=expand(2) href="javascript:void(0);">用户管理</A>
								</TD>
							</TR>
							<TR height=4>
								<TD></TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
						<TBODY>
							<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									onclick="javascript:window.close();"
									href="listusersserverlet" target=mainFrame>&nbsp;<font size=2>查看用户</font></A>
								</TD>
							</TR>
							
							<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									onclick="javascript:window.close();"
									href="searchUserServlet" target=mainFrame>&nbsp;<font size=2>查询用户</font></A>
								</TD>
							</TR>
							
							
							<TR height=4>
								<TD colSpan=2></TD>
							</TR>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
						<TBODY>
							<TR height=22>
								<TD style="PADDING-LEFT: 30px" ><A
									class=menuParent onclick=expand(3) href="javascript:void(0);">创业动态</A>
								</TD>
							</TR>
							<TR height=4>
								<TD></TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE id=child3 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
						<TBODY>
							<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									onclick="javascript:window.close();"
									href="addinformation.jsp" target=mainFrame>&nbsp;<font size=2>增加动态</font></A>
								</TD>
							</TR>
							<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									onclick="javascript:window.close();"
									href="listinfoservlet" target=mainFrame>&nbsp;<font size=2>查看动态</font></A>
								</TD>
							</TR>
							
							<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									onclick="javascript:window.close();"
									href="searchInfomationServlet" target=mainFrame>&nbsp;<font size=2>查询动态</font></A>
								</TD>
							</TR>
							
							<TR height=4>
								<TD colSpan=2></TD>
							</TR>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
						<TBODY>
							<TR height=22>
								<TD style="PADDING-LEFT: 30px" ><A
									class=menuParent onclick=expand(4) href="javascript:void(0);">优秀项目</A>
								</TD>
							</TR>
							<TR height=4>
								<TD></TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE id=child4 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
						<TBODY>
							<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									onclick="javascript:window.close();"
									href="logout" target=mainFrame>&nbsp;<font size=2>查看项目</font></A>
								</TD>
							</TR>
							<TR height=4>
								<TD colSpan=2></TD>
							</TR>
					</TABLE>
					
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
						<TBODY>
							<TR height=22>
								<TD style="PADDING-LEFT: 30px" ><A
									class=menuParent onclick=expand(5) href="javascript:void(0);">创业政策</A>
								</TD>
							</TR>
							<TR height=4>
								<TD></TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE id=child5 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
						<TBODY>
							<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									onclick="javascript:window.close();"
									href="listnewsservlet" target=mainFrame>&nbsp;<font size=2>查看政策</font></A>
								</TD>
							</TR>
								<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									onclick="javascript:window.close();"
									href="addnews.jsp" target=mainFrame>&nbsp;<font size=2>增加政策</font></A>
								</TD>
							</TR>
							
							<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									onclick="javascript:window.close();"
									href="searchNewsServlet" target=mainFrame>&nbsp;<font size=2>查询政策</font></A>
								</TD>
							</TR>
							
							<TR height=4>
								<TD colSpan=2></TD>
							</TR>
					</TABLE>					
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
						<TBODY>
							<TR height=22>
								<TD style="PADDING-LEFT: 30px" ><A
									class=menuParent onclick=expand(9) href="javascript:void(0);">退出系统</A>
								</TD>
							</TR>
							<TR height=4>
								<TD></TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE id=child9 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
						<TBODY>
							<TR height=20>
								<TD align=center width=30>
								</TD>
								<TD><A class=menuChild
									onclick="javascript:window.close();"
									href="backlogoutservlet" target="_top">&nbsp;<font size=2>退出系统</font></A>
								</TD>
							</TR>
							<TR height=4>
								<TD colSpan=2></TD>
							</TR>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
					</TABLE>
					</TD>
				</tr>	
		</tbody>
</TABLE>
</BODY>
</HTML>