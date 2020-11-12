<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet" >
<body>

<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>


<section class="section">
			<h1 id="qnatitle">공지사항페이지입니다</h1>
			<table id="notice" class="" style="text-align: center;">
				<col width="100"/>
				<col width="150"/>
				<col width="300"/>
				<col width="250"/>
				<tr>
					<th scope="col" class="">번호</th>
					<th scope="col" class="">작성자</th>
					<th scope="col" class="">제목</th>
					<th scope="col" class="">작성일</th>
				</tr>
				<c:choose>
					<c:when test="${empty notice}">
						<tr>
							<th colspan="4">-------------------------------------- 작성된 글이 없습니다.-----------------------------------</th>
						</tr>
					</c:when>
				<c:otherwise>
					<c:forEach items="${notice }" var="dto">
						<tr>
							<td>${dto.notice_no}</td>
							<td>관리자</td>
							<td><a href="noticedetail.do?notice_no=${dto.notice_no}" style="color:black;"> ${dto.notice_title}</a></td>
							<td><fmt:formatDate value="${dto.notice_date}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
				</c:choose>
					<tr>
						<td colspan="4" align="center">
							<select name="">
								<option value="" selected="selected">제목으로검색</option>
								<option value="">내용으로 검색</option>
							</select>
							<input type="search" name="" placeholder="검색어를 입력하세요"/>
							<button class="" type="submit">검색</button>
						</td>
					</tr>
					<tr>
						<sec:authorize access="hasRole('ADMIN')">
						<td colspan="4" align="right">
							<input type="button" value="글작성" onclick="location.href='noticeForm.do'"/>
						</td>
						</sec:authorize>
					</tr>
			</table>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>



</body>
</html>