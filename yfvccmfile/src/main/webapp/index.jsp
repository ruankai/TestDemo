<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<jsp:forward page="/admin/login.jsp"/>--%>
<jsp:forward page="/admin/main.jsp">
    <jsp:param name="queryStr" value=""/>
    <jsp:param name="pageNum" value="1"/>
    <jsp:param name="pageSize" value="10"/>
</jsp:forward>
