<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <title>文件管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/pagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/file.js"></script>
    <style>
        .pagebox {
            position: absolute;
            top: 90%;
            left:50%;
            transform: translate(-50%,-50%);
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

    <!-- 数据列表 -->
    <div class="table-box">
        <!-- 数据表格 -->
        <%--<table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center" style="line-height: 1">--%>
        <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center" style="line-height: 1">
            <thead>
            <tr>
                <th class="sorting_asc">文件名称</th>
                <th class="sorting">上传时间</th>
                <%--<c:if test="${USER_SESSION.name!=null }">--%>
                <%--<th class="sorting">操作</th>--%>
                <%--</c:if>--%>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageResult.rows}" var="file">
                <tr>
                    <td>
                        <form action="${pageContext.request.contextPath}/file/findById"   >
                            <button type="submit" hidden="true" class="btn bg-olive " data-toggle="modal"
                                     name="fileid" value=${file.fileid} data-target="#borrowModal" >  ${file.filename}
                             </button>
                        </form>
                    </td>
                    <td>${file.uploadtime}</td>
                    <%--<td>--%>
                        <%--<c:if test="${USER_SESSION.name!=null }">--%>
                            <%--<button  onclick="deletefile()"  id="fileid" value="${file.fileid}"> 删除--%>
                            <%--</button>--%>
                        <%--</c:if>--%>
                    <%--</td>--%>
                </tr>
            </c:forEach>
            <tr>
                <td>
                    <li class="pagebox">
                        <form action=${gourl} >
                            <input type="text"  hidden="true" name="queryStr" value=${queryStr} ></input>
                            <input type="text" hidden="true" value="">共${pageResult.total}个文件,第${pageNum}页，共${sumPage}页</input>
                            <c:if test="${pageNum!=1}">
                                <button type="submit" class="btn bg-olive btn-xs" data-toggle="modal"
                                        name="pageNum" value=1 data-target="#borrowModal" >首页
                                </button>
                            </c:if>
                            <c:if test="${pageNum>1}">
                                <button type="submit" class="btn bg-olive btn-xs" data-toggle="modal"
                                        name="pageNum" value=${pageNum-1}  data-target="#borrowModal" >上一页
                                </button>
                            </c:if>
                            <c:choose>
                                <c:when test="${sumPage<=5}">
                                    <c:set var="begin" scope="page" value="1"></c:set>
                                    <c:set var="end" scope="page" value="${sumPage}"></c:set>
                                </c:when>
                                <c:when test="${sumPage>5}">
                                    <c:choose>
                                        <c:when test="${pageNum<=3}">
                                            <c:set var="begin" value="1"></c:set>
                                            <c:set var="end" value="5"></c:set>
                                        </c:when>
                                        <c:when test="${pageNum> sumPage-3}">
                                            <c:set var="begin" value="${sumPage-4}"></c:set>
                                            <c:set var="end" value="${sumPage}"></c:set>
                                        </c:when>
                                        <%--其余其他情况，显示（当前页码-2）-（当前页码+2）--%>
                                        <c:otherwise>
                                            <c:set var="begin" value="${pageNum-2}"></c:set>
                                            <c:set var="end" value="${pageNum+2}"></c:set>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                            </c:choose>
                            <c:forEach begin="${begin}" end="${end}" var="i">
                                <c:if test="${i==pageNum&&i<=sumPage}">
                                        <button type="submit" class="btn bg-olive btn-xs" data-toggle="modal"
                                                name="pageNum" value=${i}  data-target="#borrowModal" >
                                            <c:if test="${i<=sumPage}">${i}</c:if>
                                        </button>
                                </c:if>
                                <c:if test="${i!=pageNum&&i<=sumPage}">
                                        <button type="submit" class="btn bg-olive btn-xs" data-toggle="modal"
                                                name="pageNum" value=${i}  data-target="#borrowModal" >
                                           ${i}
                                        </button>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageNum<sumPage}">
                                <button type="submit" class="btn bg-olive btn-xs" data-toggle="modal"
                                        name="pageNum" value=${pageNum+1} data-target="#borrowModal" >下一页
                                </button>
                            </c:if>
                            <c:if test="${pageNum!=sumPage}">
                                <button type="submit" class="btn bg-olive btn-xs" data-toggle="modal"
                                        name="pageNum" value=${sumPage} data-target="#borrowModal" >尾页
                                </button>
                            </c:if>
                        </form>
                    </li>
                </td>
            </tr>
            </tbody>
        </table>
        <!--数据表格/-->
        <%--分页插件--%>
        <div id="pagination" class="pagination"></div>
    </div>
    <!--数据列表/-->
</div>
</body>
</html>