<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Su - Search Page</title>
<link href="${pageContext.request.contextPath}/resources/css/search.css" rel="stylesheet" >
</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>

	<section>
		<div>
		<div class="title">
			<p>검색 결과</p>
		</div>
			<table class="list">
				<colgroup>
					<col width=""/>
					<col width=""/>
					<col width=""/>
					<col width=""/>
					<col width=""/>
				</colgroup>
				<thead>
					<tr>
						<th>강의 제목</th>
						<th>강사 ID</th>
						<th>강사 이름</th>
						<th>강의 가격</th>
						<th>강의 별점</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5">검색 결과가 없습니다.</td>
							</tr>	
						</c:when>
						<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<tr>
								<c:choose>
									<c:when test="${dto.class_type eq 'V' }">
										<td><a href="video/studydetail?class_no=${dto.class_no }&member_id=${member_id }">${dto.class_title }</a></td>
									</c:when>
									<c:otherwise>
										<td><a href="with/studydetail?class_no=${dto.class_no }&member_id=${member_id }">${dto.class_title }</a></td>
									</c:otherwise>
								</c:choose>
								<td>${dto.class_teacherid }</td>
								<td>${dto.class_teachername }</td>
								<td>${dto.class_price }</td>
								<td></td>
							</tr>
						</c:forEach>
						</c:otherwise>	
					</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" style="text-align:right;">
							<input type="button" value="뒤로" onclick="location.href='main'">
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>