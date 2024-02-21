<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <script src="${pageContext.request.contextPath}/js/my.js"></script>
    <style>
        .inline {
            display: inline-block;
        }
        .upload{
            font-size:130%;
            position: absolute;
            top: 20%;
            left:30%;
        }
        .upload-button {
            /*background-color: #16b85f; !* 设置背景色 *!*/
            /*border: none; !* 去除边框 *!*/
            /*color: white; !* 文字颜色为白色 *!*/
            /*padding: 12px 36px; !* 内边距 *!*/
            /*text-align: center; !* 居中对齐 *!*/
            /*cursor: pointer; !* 光标变成手型 *!*/

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
<!-- .box-body -->

        <%--新增按钮：如果当前登录用户是管理员，页面展示按钮--%>
        <c:if test="${USER_SESSION!=null}">
                    <div class="upload">
                        <c:if test="${USER_SESSION!=null }">
                            <%--method="post" enctype="multipart/form-data"--%>
                            <form action="${pageContext.request.contextPath}/file/fileupload"  method="post" enctype="multipart/form-data" style="width:  1000px;">
                                    <%--<label>上传文件：</label>--%>

                                    <div class="inline">
                                        <%--<label for="filename">Input 1:</label><br/>--%>
                                        文件名称<input  type="text" id="filename" name="filename"  />
                                    </div>
                                    <div class="inline">
                                        <%--<label for="mulfile">Input 1:</label><br/>--%>
                                        <input  type="file" id="mulfile" name="mulfile"  />
                                    </div>
                                    <%--<input  type="file" name="mulfile"  /></li><br/>--%>
                                        <input type="submit"   class="upload-button" value="确定上传"  > </input>
                                        <div style="line-height:2;">
                               <br/> <br/>  注意：1.上传的文件名称不能超过100个字符<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            2.上传的文件大小不能超过50M <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            3.如果没有在文本框输入文件名称，将以上传的文件原始名称作为上传后文件题目
                                        </div>
                            </form>
                        </c:if>
                    </div>
        </c:if>


</body>
</html>