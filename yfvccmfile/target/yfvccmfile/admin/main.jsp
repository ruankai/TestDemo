<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <title>云中医职院文件汇编</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_all-skins.min.css">
    <link rel="icon" type="image/jpg" href="${pageContext.request.contextPath}/img/badge.jpg"/>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script><script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript">
        function SetIFrameHeight() {
            var iframeid = document.getElementById("iframe");
            if (document.getElementById) {
                /*设置 内容展示区的高度等于页面可视区的高度*/
                iframeid.height = document.documentElement.clientHeight;
            }
        }
    </script>
    <style>
        .homepage {
            font-size: 150%;
            font-weight:bold;
        }
    </style>
</head>

<body class="hold-transition skin-green sidebar-mini">
<div class="wrapper">
    <!-- 页面头部 -->
    <header class="main-header">
        <!-- Logo -->
        <a href="${pageContext.request.contextPath}/admin/main.jsp" class="logo">
            <span class="logo-lg"><b>云中医职院文件汇编</b></span>
        </a>
        <!-- 头部导航 -->
        <nav class="navbar navbar-static-top">
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a>
                            <img src="${pageContext.request.contextPath}/img/user.jpg" class="user-image"
                                 alt="User Image">
                            <span class="hidden-xs">${USER_SESSION.name}</span>
                                                    </a>
                    </li>
                    <c:if test="${USER_SESSION.name==null }">
                        <li class="dropdown user user-menu">
                            <a href="${pageContext.request.contextPath}/admin/login.jsp">
                                <span class="hidden-xs">登录</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${USER_SESSION.name!=null }">
                        <li class="dropdown user user-menu">
                            <a href="${pageContext.request.contextPath}/toupdatepass" target="iframe">修改密码</a>
                        </li>
                        <li class="dropdown user user-menu">
                            <a href="${pageContext.request.contextPath}/logout">
                                <span class="hidden-xs">注销</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
    </header>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="homepage" >
                    <a href="${pageContext.request.contextPath}/file/selectNewFiles" target="iframe">
                        <i class="homepage"></i>首页
                    </a>
                </li>
                <c:if test="${USER_SESSION.name!=null }">
                <li class="homepage">
                    <a href="${pageContext.request.contextPath}/file/uploadJump" target="iframe">
                        <i class="fa fa-circle-o"></i>上传文件
                    </a>
                </li>
                </c:if>
                <li >
                    <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=dangzhengban&deptChinese=党政办" target="iframe">
                        <i class="fa fa-circle-o"></i>党政办
                    </a>
                </li>
                <li >
                    <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=zuzhirenshi&deptChinese=组织人事部" target="iframe">
                        <i class="fa fa-circle-o"></i>组织人事部
                    </a>
                </li>
                <li >
                    <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=jiaowubu&deptChinese=教务部" target="iframe">
                        <i class="fa fa-circle-o"></i>教务部
                    </a>
                </li>
                <li >
                    <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=xueshengchu&deptChinese=学生工作部" target="iframe">
                        <i class="fa fa-circle-o"></i>学生工作部
                    </a>
                </li>
                <li >
                    <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=caiwubu&deptChinese=财务部" target="iframe">
                        <i class="fa fa-circle-o"></i>财务部
                    </a>
                </li>
                <li >
                    <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=zongwubu&deptChinese=总务部" target="iframe">
                        <i class="fa fa-circle-o"></i>总务部
                    </a>
                </li>
                <li >
                    <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=xinxizhongxin&deptChinese=信息中心" target="iframe">
                        <i class="fa fa-circle-o"></i>信息中心
                    </a>
                </li>
                                <li >
                    <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=tushuguan&deptChinese=图书馆" target="iframe">
                        <i class="fa fa-circle-o"></i>图书馆
                    </a>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- 导航侧栏 /-->
    <!-- 内容展示区域 -->
    <div class="content-wrapper">
        <iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()"
                <%--frameborder="0" src="${pageContext.request.contextPath}/book/selectNewbooks"></iframe>--%>
                frameborder="0" src="${pageContext.request.contextPath}/file/selectNewFiles"></iframe>
    </div>
</div>
</body>
</html>