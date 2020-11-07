<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#first_area{
		margin-top: 20px;
	}
	.area{
		margin-top: 20px;
		position: static;
	}
	.first_table_name{
		margin-left: 7.5%;
	}
	.admin_first_table{
		margin-left: 7.5%;
		margin-right: 7.5%;
		width:35%;
		float:left;
	}
	.second_table_name{
		margin-
	}
	.admin_second_table{
		width:50%;
		float:right;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- header -->
	<div class="header_area">
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	</div>
	<div id="first_area">
	<div class="first_table_name">전체 회원조회</div>
	<table class="admin_first_table" border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
		</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.member_no }</td>
					<td>${dto.member_id }</td>
					<td>${dto.member_name }</td>
					<td>${dto.member_email }</td>
				</tr>
			</c:forEach>
	</table>
	<div class="more">
		<a href="memberlist.do">더 보기</a>
	</div>
	</div>
	<div>
	<div class="second_table_name">강사인증 신청목록</div>
	<table class="admin_second_table" border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>현재권한</th>
		</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.member_no }</td>
					<td>${dto.member_id }</td>
					<td>${dto.member_name }</td>
					<td>${dto.member_role }</td>
				</tr>
			</c:forEach>
	</table>
		<a href="reviewlist.do">더 보기</a>
	</div>
	<div id="second_area">
	<h1>신고된 회원조회</h1>
	<table class="admin_third_table" border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>신고일</th>
			<th>신고받은사람</th>
		</tr>
		
			<c:forEach items="${reportlist }" var="rdto">
				<tr>
					<td>${rdto.report_no }</td>
					<td>${rdto.report_title }</td>
					<td>${rdto.report_date }</td>
					<td>${rdto.report_ided }</td>
				</tr>
			</c:forEach>
	</table>
	<h3><a href="reportlist.do">더보기</a></h3>
	<h1>동영상 심의 신청조회</h1>
	<table class="admin_fore_table" border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>타이틀</th>
			<th>강사아이디</th>
		</tr>
		<!-- 
			<c:forEach items="${reportlist }" var="reportdto">
				<tr>
					<td>${dto.review_no }</td>
					<td>${dto.review_category }</td>
					<td>${dto.review_title }</td>
					<td>${dto.review_id }</td>
				</tr>
			</c:forEach>
		 -->
	</table>
	<h3><a href="videoreviewlist.do">더 보기</a></h3>
	</div>
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>
	
</body>
</html>