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
    </style>
</head>

<body class="hold-transition skin-red sidebar-mini">
<!-- .box-body -->
<div class="box-header with-border">
    <%--<h3 class="box-title">文件管理</h3>--%>
</div>
<div class="box-body">
   <%--新增按钮 /--%>
    <!--工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/file/search" method="post">
                文件名称：<input name="queryStr" value="${queryStr}">&nbsp&nbsp&nbsp&nbsp
                <%--上传部门：<input name="author" value="${file.author}">&nbsp&nbsp&nbsp&nbsp--%>
                <input class="btn btn-default" type="submit" value="查询">
                <%--<input type="text" value="">共${pageResult.total}个文件，共${sumPage}页,现在是第${pageNum}页</input>--%>
            </form>
        </div>
    </div>
 </div>





<div class="box">
    <div class="box_son1">
        <div class="box2">
                <table align="left">
                    <thead>
                    <tr>
                        <th class="sorting_asc">党政办</th>
                        <th class="sorting">
                            <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=dangzhengban&amp;deptChinese=党政办">
                                查看更多</a>
                        </th>
                    </tr>
                    </thead>

                    <tbody><c:forEach items="${dangzhengbanPageResult.rows}" var="adminfile">

                         <tr align="left">
                            <td align="left">
                                <form action="${pageContext.request.contextPath}/file/findById">
                                    <button type="submit" hidden="true" class="btn bg-olive btn-xs"
                                            data-toggle="modal" name="fileid" value="${adminfile.fileid}" data-target="#borrowModal">  ${adminfile.filename}
                                    </button>
                                </form>
                            </td>
                            <td>${fn:substring(adminfile.uploadtime, 0, 10)}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>

    <div class="box2">
        <div class="box_son2">
            <table>
                <thead>
                <tr>
                    <th class="sorting_asc">组织人事部</th>
                    <th class="sorting">
                        <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=zuzhirenshi&amp;deptChinese=组织人事部">
                            查看更多></a>
                    </th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${zuzhirenshiPageResult.rows}" var="adminfile">
                    <tr>
                        <td>
                            <form action="${pageContext.request.contextPath}/file/findById">
                                <button type="submit" hidden="true" class="btn bg-olive btn-xs"
                                        data-toggle="modal" name="fileid" value="${adminfile.fileid}" data-target="#borrowModal">  ${adminfile.filename}
                                </button>
                            </form>
                        </td>
                        <td>${fn:substring(adminfile.uploadtime, 0, 10)}</td>
                    </tr>
                </c:forEach>


                </tbody></table>
        </div>
    </div>
</div>

<div class="box">
    <div class="box_son1">
        <div class="box2">
            <table>
                <thead>
                <tr>
                    <th class="sorting_asc">教务部</th>
                    <th class="sorting">
                        <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=jiaowubu&amp;deptChinese=教务部">
                            查看更多</a>
                    </th>
                </tr>
                </thead>
                <c:forEach items="${jiaowubuPageResult.rows}" var="adminfile">

                    <tr>
                        <td>
                            <form action="${pageContext.request.contextPath}/file/findById">
                                <button type="submit" hidden="true" class="btn bg-olive btn-xs"
                                        data-toggle="modal" name="fileid" value="${adminfile.fileid}" data-target="#borrowModal">  ${adminfile.filename}
                                </button>
                            </form>
                        </td>
                        <td>${fn:substring(adminfile.uploadtime, 0, 10)}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <div class="box2">
        <div class="box_son2">
            <table class="a1">
                <thead>
                <tr>
                    <th class="sorting_asc">学生工作部</th>
                    <th class="sorting">
                        <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=xueshengchu&amp;deptChinese=学生工作部">
                            查看更多</a>
                    </th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${xueshengchuPageResult.rows}" var="adminfile">
                    <tr>
                        <td>
                            <form action="${pageContext.request.contextPath}/file/findById">
                                <button type="submit" hidden="true" class="btn bg-olive btn-xs"
                                        data-toggle="modal" name="fileid" value="${adminfile.fileid}" data-target="#borrowModal">  ${adminfile.filename}
                                </button>
                            </form>
                        </td>
                        <td>${fn:substring(adminfile.uploadtime, 0, 10)}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>


</div>

<div class="box">
    <div class="box_son1">
        <div class="box2">
            <table>
                <thead>
                <tr>
                    <th class="sorting_asc">财务部</th>
                    <th class="sorting">
                        <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=caiwubu&amp;deptChinese=财务部">
                            查看更多</a>
                    </th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${caiwubuPageResult.rows}" var="adminfile">

                    <tr>
                        <td>
                            <form action="${pageContext.request.contextPath}/file/findById">
                                <button type="submit" hidden="true" class="btn bg-olive btn-xs"
                                        data-toggle="modal" name="fileid" value="${adminfile.fileid}" data-target="#borrowModal">  ${adminfile.filename}
                                </button>
                            </form>
                        </td>
                        <td>${fn:substring(adminfile.uploadtime, 0, 10)}</td>
                    </tr>
                </c:forEach>

                </tbody></table>
        </div>
    </div>

    <div class="box2">
        <div class="box_son2">
            <table class="a1">
                <thead>
                <tr>
                    <th class="sorting_asc">总务部</th>
                    <th class="sorting">
                        <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=zongwubu&amp;deptChinese=总务部">
                            查看更多</a>
                    </th>
                </tr>
                </thead>
                <tbody><c:forEach items="${zongwubuPageResult.rows}" var="adminfile">
                    <tr>
                        <td>
                            <form action="${pageContext.request.contextPath}/file/findById">
                                <button type="submit" hidden="true" class="btn bg-olive btn-xs"
                                        data-toggle="modal" name="fileid" value="${adminfile.fileid}" data-target="#borrowModal">  ${adminfile.filename}
                                </button>
                            </form>
                        </td>
                        <td>${fn:substring(adminfile.uploadtime, 0, 10)}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


</div>

<div class="box">
    <div class="box_son1">
        <div class="box2">
            <table>
                <thead>
                <tr>
                    <th class="sorting_asc">信息中心</th>
                    <th class="sorting">
                        <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=xinxizhongxin&amp;deptChinese=信息中心">
                            查看更多</a>
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${xinxizhongxinPageResult.rows}" var="adminfile">
                    <tr>
                        <td >
                            <form action="${pageContext.request.contextPath}/file/findById">
                                <button type="submit" hidden="true" class="btn bg-olive btn-xs"
                                        data-toggle="modal" name="fileid" value="${adminfile.fileid}" data-target="#borrowModal">  ${adminfile.filename}
                                </button>
                            </form>
                        </td>
                        <td>${fn:substring(adminfile.uploadtime, 0, 10)}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <div class="box2">
        <div class="box_son2">
            <table class="a1">
                <thead>
                <tr>
                    <th class="sorting_asc">图书馆</th>
                    <th class="sorting">
                        <a href="${pageContext.request.contextPath}/file/deptmentFiles?department=tushuguan&amp;deptChinese=图书馆">
                            查看更多</a>
                    </th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${tushuguanPageResult.rows}" var="adminfile">

                    <tr>
                        <td>
                            <form action="${pageContext.request.contextPath}/file/findById">
                                <button type="submit" hidden="true" class="btn bg-olive btn-xs"
                                        data-toggle="modal" name="fileid" value="${adminfile.fileid}" data-target="#borrowModal">  ${adminfile.filename}
                                </button>
                            </form>
                        </td>
                        <td>${fn:substring(adminfile.uploadtime, 0, 10)}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>


</div>













</body>
</html>