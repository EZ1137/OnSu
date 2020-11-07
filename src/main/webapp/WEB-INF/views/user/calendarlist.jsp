<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/calendar.css" rel="stylesheet" >
</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
	
	
	<section>
	<div class="title">
		<p>일정 목록</p>
	</div>
		<div>
		<jsp:useBean id="utils" class="com.kh.onsoo.utils.Utils" />
		<table class="list">
			<col width="50px" />
			<col width="250px" />
			<col width="200px" />
			<col width="200px" />
			<tr>
				<th>번   호</th>
				<th>제   목</th>
				<th>일   정</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="4">-----일정이 없습니다.-----</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.calendar_no}</td>
							<td><a style="color:blue;" href="calendarDetail.do?calendar_no=${dto.calendar_no }">${dto.calendar_title }</a></td>
							<td>
								<jsp:setProperty property="toDates" name="utils" value="${dto.calendar_mdate }" />
								<jsp:getProperty property="toDates" name="utils" />
							</td>
							<td>
								<fmt:formatDate value="${dto.calendar_regdate }" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="4"  style="text-align:right;">
					<input class="btn btn-secondary mb-3" type="button" value="달력 보기" onclick="location.href='calendar.do'" />
				</td>
			</tr>
		</table>
   		</div>
	</section>
	
   
   <!-- footer -->
	<footer id="footerarea" class="area">
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp"%>
		</footer>
	</footer>

</body>
</html>