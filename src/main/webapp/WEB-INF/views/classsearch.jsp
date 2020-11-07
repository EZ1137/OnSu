<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section>
		<div>
			<h1>검색 결과</h1>
			<table>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<th>검색 결과가 없습니다.</th>
						</tr>	
					</c:when>
					<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td><a href="">${dto.class_title }</a></td>
							<td>${dto.class_price }</td>
						</tr>
					</c:forEach>
					</c:otherwise>	
				</c:choose>
			</table>
		</div>
	</section>

</body>
</html>