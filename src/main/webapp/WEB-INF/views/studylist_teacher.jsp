<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/study.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
    
	<section class="section area">
		<!-- 타이틀 -->
		<div class="free_board_title">
			<p>강의 목록</p>
		</div>
		<div class="container">
		<!-- 게시판 목록 -->
		<table class="free_list01">
			<colgroup>
				<col width="10%" />
				<col width="60%" />
				<col width="30%" />
			</colgroup>

			<thead>
				<tr>
					<th>No.</th>
					<th>TITLE</th>
					<th>Category</th>
				</tr>
			</thead>

			<tbody>

				<c:choose>
					<c:when test="${empty withList }">
						<tr>
							<th colspan="3">------------ 강의가 없습니다 ----------------</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${withList }" var="dto">
							<tr>
								<td>${dto.class_no }</td>
								<td><a href="with/teacher/studydetail.do?class_no=${dto.class_no}">${dto.class_title }</a></td>
								<td># ${dto.class_bigcategory } # ${dto.class_smallcategory }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</tbody>

			<tfoot>

				<tr>
					<td colspan="6" class="qbtnbar" style="text-align: right;">
						<input type="button" value="수업 등록" onclick="location.href='with/teacher/studyinsert.do'" />
					</td>
				</tr>


			</tfoot>
		</table>
		<table class="free_list02">
			<colgroup>
				<col width="10%" />
				<col width="60%" />
				<col width="30%" />
			</colgroup>

			<thead>
				<tr>
					<th>No.</th>
					<th>TITLE</th>
					<th>Category</th>
				</tr>
			</thead>

			<tbody>

				<c:choose>
					<c:when test="${empty videoList }">
						<tr>
							<th colspan="4">------------ 강의가 없습니다 ----------------</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${videoList }" var="dto">
							<tr>
								<td>${dto.class_no }</td>
								<td><a href="video/teacher/studydetail.do?class_no=${dto.class_no}">${dto.class_title }</a></td>
								<td># ${dto.class_bigcategory } # ${dto.class_smallcategory }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</tbody>

			<tfoot>

				<tr>
					<td colspan="6" class="qbtnbar" style="text-align: right;">
						<input type="button" value="수업 등록" onclick="location.href='video/teacher/studyinsert.do'" />
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