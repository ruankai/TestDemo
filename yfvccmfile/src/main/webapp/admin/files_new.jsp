<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%@ page language="java" import="java.util.ResourceBundle" %>--%>
<html>
<head>
    <%--<%ResourceBundle res=ResourceBundle.getBundle("file"); %>--%>
    <meta charset="utf-8">
    <title>文件管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/pagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/file.js"></script>
    <style>
        .loginmanage{height:900px;width:1920px;background:url(../img/schoolbackground.jpg);background-repeat: no-repeat; /* 取消重复平铺 */
            background-position: center; /* 居中定位 */background-size: contain; ;vertical-align:middle;display:table-cell;opacity: 0.5;}
        .searchbox {
            font-size:150%;
            position: absolute;
            top: 30%;
            left:60%;
            transform: translate(-50%,-50%);
            opacity: 1;
        }
        .tip {
            font-size:150%;
            position: absolute;
            top: 38%;
            left:42%;
            transform: translate(-50%,-50%);
            /*opacity: 1;*/
        }
        table{
            border: 1px solid #000;
        }

        .box1{
            float: left;
            width: 300px;
        }
        .box2{
            float: left;
            width: 300px;
        }
        .upload-button {
            background-color: #16b85f;
            color: #FFFFFF;
            border-radius: 3px;
            border: 0px;
            width: 150px;
            height: 32px;
            display: inline-block;
            box-shadow: 3px 3px 10px #555555;
            margin-right: 10px;

        }
    </style>
</head>

<body class="hold-transition skin-red sidebar-mini">
<div class="loginmanage"></div>


   <%--新增按钮 /--%>
    <!--工具栏 数据搜索 -->
      <div class="searchbox">
            <form action="${pageContext.request.contextPath}/file/search" method="post" style="width: 1000px;">
                搜索文件：<input name="queryStr" value="${queryStr}" placeholder="请输入文件名称，可空格分割关键字 " style="width: 50%">&nbsp&nbsp&nbsp
                <%--<img class="topInput left" src="${pageContext.request.contextPath}/img/search.png" id="keyWord" onclick="searchKeyword()">--%>
                <input type="submit" value="查询"  class="upload-button ">
            </form>
        </div>
    </div>

    <div class="tip">
        提示：本平台仅支持校园网络访问！
    </div>

</body>
</html>