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
	<h1>강의 리스트</h1>
	
	<table border="1">
		<colgroup>
			<col width="50">
			<col width="100">
			<col width="300">
			<col width="100">
		</colgroup>
		
		<tr>
			<th>강의 번호</th>
			<th>강의명</th>
			<th>강사명</th>
			<th>강의 내용</th>
			
		</tr>
		
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<th colspan="4">------------ 강의가 없습니다 ----------------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.class_no }</td>
						<td><a href="studydetail.do?class_no=${dto.class_no }">${dto.class_title }</a></td>
						<td><a href="memberdetail.do?member_no=${dto.class_teacherid }">${dto.class_teachername }</a></td>
						<td>${dto.class_info }</td>
						
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="글작성" onclick="location.href='studyinsert.do'"/>
			</td>
		</tr>
	</table>
</body>
</html>