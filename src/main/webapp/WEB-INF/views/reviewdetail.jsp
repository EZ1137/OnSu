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
	<table border="1">
		<tr>
			<th></th>
			<td></td>
		</tr>
		<tr>
			<th></th>
			<td></td>
		</tr>
		<tr>
			<th></th>
			<td><textarea rows="10" cols="60" readonly="readonly">첨부파일 미리보기</textarea></td>
		</tr>
		<tr>
			<th></th>
			<td></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<select>
					<option>-----인증 여부-----</option>
					<option>강사인증 완료</option>
					<option>강사인증 실패</option>
				</select>
				<input type="button" value="인증완료">
				<input type="button" value="목록" onclick="location.href='reviewlist.do'"/>
			</td>
		</tr>
	</table>
</body>
</html>