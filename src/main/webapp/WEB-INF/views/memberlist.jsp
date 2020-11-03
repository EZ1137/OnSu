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
	<h1>전체회원 목록</h1>
	<table border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>탈퇴일자</th>
			<th>정지일자</th>
			<th>권한</th>
		</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.member_no }</td>
					<td>${dto.member_id }</td>
					<td>${dto.member_name }</td>
					<td>${dto.member_email }</td>
					<td>${dto.member_phone }</td>
					<td>${dto.member_deletedate }</td>
					<td>${dto.member_blockdate }</td>
					<td>${dto.member_role }</td>
				</tr>
			</c:forEach>
	</table>
	<input type="button" value="관리자페이지 메인이동" onclick="location.href='admin.do'">
</body>
</html>