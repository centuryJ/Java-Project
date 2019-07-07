<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>用户登录</title>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.enplaceholder.js" type="text/javascript" charset="utf-8"></script>
<script src="js/base.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/sea.js"></script>
<script type="text/javascript" src="js/base(1).js"></script>
<script src="js/MD5.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-validate-1.12.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/validate-common.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/check_reg.js"></script>
</head>
<body>
<font color="red">${requestScope.info }</font>
<!--头部-->
<c:import url="header.jsp"/>
<!--end 头部-->
<div class="content">
	<!--内容区-->
    <div class="login-box">
        <div class="wrap clearfix">
            <div class="login-box-wind">
                <div class="login-tit">
                    <h2>用户登录</h2>
                    <h4 style="color: red;">${requestScope.errorInfo }</h4>
                </div>
                <div class="login-cnt">
                    <div class="frm-lst">
                    <form id="form1" action="loginservlet" name="form1" method="post" novalidate="novalidate">
                        <ul>
                            <li>
                                <div class="frm-inp"><input type="text" name="username" value="" class="inp ico-user-name" placeholder="账号" id="username"></div>
                                
                            </li>
                            <li>
                                <div class="frm-inp"><input type="password" name="password" class="inp ico-user-pswd" placeholder="密码" id="password"></div>
                                
                            </li>
                        </ul>
                    </form>
                    </div> 		
                    <div class="frm-lst-smt">
                    	<script type="text/javascript">
                    	function tosubmit(){
                    		document.getElementById("form1").submit();
                    	}
                    	</script>
                        <a href="javascript:tosubmit()" class="btn-red-big" id="loginIn"><span>登录</span></a>
                    </div>
                    <div class="fgt">
                    	<a href="javascript:void(0);" class="now-reg-btn"><span>立即注册</span></a>
                        <a href="" class="fgt-lnk"><span>忘记密码</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--end 内容区-->
</div>
<!--底部-->
<c:import url="/footer.jsp"/>
</body>
</html>
