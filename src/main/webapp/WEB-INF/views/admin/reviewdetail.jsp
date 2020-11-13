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
<h1>강사인증 페이지</h1>
	<form action="${pageContext.request.contextPath}admin/reviewupdate.do" method="get">
	<input type="hidden" name="member_id" value="${dto.member_id }"/>
	<table border="1">
		<tr>
			<th>작성자 ID</th>
			<td>${dto.member_id }</td>
		</tr>
		<tr>
			<th>현재 권한</th>
			<td>${dto.member_role }</td>
		</tr>
		<tr>
			<th>첨부파일<br>미리보기</th>
			<td><embed class="previewimg" src="<c:url value='admin/resources/img/sample3.pdf'/>" type="application/pdf" width="100%" height="300px" /></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				 <select name="member_role">
					<option value="">-----인증 여부-----</option>
					<option value="T">강사인증 완료</option>
					<option value="S">강사인증 실패</option>
				</select>
				<input type="submit" value="인증완료">
				<input type="button" value="목록" onclick="location.href='<c:url value="/admin/reviewlist.do"/>'"/>
			</td>
		</tr>
	</table>
	</form>
	<input type="button" value="관리자 메인페이지" onclick="location.href='<c:url value="/admin/admin.do"/>'">
	
</body>
</html>