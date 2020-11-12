<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>신고페이지</h1>
	<table border="1">
		<col width="100">
		<col width="200">
		<col width="100">
		<col width="150">
		<col width="50">
		<col width="100">
		<tr>
			<th>ID</th>
			<th>CONTENT</th>
			<th>IDED</th>
			<th>DATE</th>
			<th>CATEGORY</th>
			<th>DETAIL</th>
		</tr>
		
		<c:forEach items="${reportlist }" var="dto">
			<tr>
				<td>${dto.report_id }</td>
				<td>${dto.report_content }</td>
				<td>${dto.report_ided }</td>
				<td>${dto.report_date }</td>
				<td>${dto.report_category }</td>
				<td><input type="button" value="보기" onclick="location.href='<c:url value="admin/reportdetail.do?report_id=${dto.report_id}"/>'"/> </td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>