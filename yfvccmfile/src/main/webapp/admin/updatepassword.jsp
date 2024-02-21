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
    <script src="${pageContext.request.contextPath}/js/changePw.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/file.js"></script>
 </head>

<body>
<div class="message-content">

    <div class="message-list">
        <div>
            <div style="margin-right: 10px">
                <div style="margin-top: 30px;text-align: center;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;旧密码：
                    <input type="password" name="oldPassword" id="oldPassword" class="input"/>
                    <input type="text" value=${pageContext.request.contextPath} id="projectname" hidden="true" />
                </div>
                <div style="margin-top: 34px;text-align: center;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新密码：
                    <input type="password"  name="newPassword" id="newPassword" class="input"/>
                </div>
                <div style="margin-top: 38px;text-align: center;">
                    确认新密码：
                    <input type="password"  name="reNewPassword" id="reNewPassword" class="input"/>
                </div>
                <div style="margin-top: 20px;text-align: center;">
                    <span class="errorMsg" style="color:red" id="errorMsg"></span>
                    <span class="successMsg" style="color:green" id="successMsg"></span>
                </div>
                <div style="margin-top: 44px;text-align: center;">
                    <input class="button" type="button" value="保存" id="save" style="margin-right:30px;width: 60px;  height:30px;"></input>
                    <input class="button" type="button" value="清空" id="clear" style="width: 60px;  height:30px;"></input>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>