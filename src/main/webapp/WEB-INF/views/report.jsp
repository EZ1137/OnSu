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
		<col width="50">
		<col width="100">
		<col width="100">
		<col width="150">
		<col width="100">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>신고일</th>
			<th>신고받은사람</th>
			<th>상세보기</th>
		</tr>
		
		<c:forEach items="${reportlist }" var="dto">
			<tr>
				<td>${dto.report_no }</td>
				<td>${dto.report_title }</td>
				<td>${dto.report_date }</td>
				<td>${dto.report_ided }</td>
				<td><input type="button" value="보기" onclick="location.href='reportdetail.do?report_no=${dto.report_no}'"/> </td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>