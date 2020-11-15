<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - Admin Main</title>
<link href="${pageContext.request.contextPath}/resources/css/admin.css?after" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	
	<section>
		<div id="first_area" onclick="location.href='<c:url value="/admin/memberlist.do"/>'">
			<div class="first_table_all">
				<p class="first_table_name">전체 회원 조회</p>
				<table class="admin_first_table">
					<colgroup>
						<col width="30%"/>
						<col width="20%"/>
						<col width="50%"/>
					</colgroup>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>EMAIL</th>
					</tr>
					
				<c:forEach items="${list}" var="dto">
					<tr>
						<td style="overflow:auto;">${dto.member_id}</td>
						<td>${dto.member_name}</td>
						<td style="overflow:auto;">${dto.member_email}</td>
					</tr>
				</c:forEach>
				
				</table>
			</div>
		</div>
		
		<div id="second_area" onclick="location.href='<c:url value="/admin/reviewlist.do"/>'">
			<div class="second_table_all">
				<p class="second_table_name">강사 인증 신청</p>
				<table class="admin_second_table">
					<colgroup>
						<col width="30%"/>
						<col width="20%"/>
						<col width="50%"/>
					</colgroup>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>EMAIL</th>
					</tr>
					
				<c:forEach items="${teacherlist}" var="dto">
					<tr>
						<td style="overflow:auto;">${dto.member_id}</td>
						<td>${dto.member_name}</td>
						<td style="overflow:auto;">${dto.member_email}</td>
					</tr>
				</c:forEach>
				
				</table>
			</div>
		</div>	
		
		<div id="third_area" onclick="location.href='<c:url value="/admin/reportlist.do"/>'">
			<div class="third_table_all">
				<p class="third_table_name">신고 회원 조회</p>
				<table class="admin_third_table">
					<colgroup>
						<col width="30%"/>
						<col width="55%"/>
						<col width="15%"/>
					</colgroup>
					<tr>
						<th>ID</th>
						<th>TITLE</th>
						<th>DATE</th>
					</tr>
					
				<c:forEach items="${reportlist}" var="rdto">
					<tr>
						<td style="overflow:auto;">${rdto.report_ided}</td>
						<td style="overflow:auto;">${rdto.report_content}</td>
						<td><fmt:formatDate value="${rdto.report_date}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
				
				</table>
			</div>
		</div>
	</section>
	 
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>
	
</body>
</html>