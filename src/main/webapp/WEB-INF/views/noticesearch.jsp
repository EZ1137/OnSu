<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Su - Notice</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/noticesearch.css" rel="stylesheet" >
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
    
	<section>
		<table>
			<colgroup>
				<col width="10%">
				<col width="65%">
				<col width="10%">
				<col width="15%">
			</colgroup>	
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">			
						<tr>
							<td colspan="4">검색결과가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.notice_no}</td>
								<td>
									<a href="noticedetail?notice_no=${dto.notice_no}" style="color:black; float:left; padding-left:30px;">${dto.notice_title}</a>
								</td>
								<td>관리자</td>
								<td>
									<fmt:formatDate value="${dto.notice_regdate}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>