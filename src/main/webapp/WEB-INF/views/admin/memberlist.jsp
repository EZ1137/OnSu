<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - Member List</title>
<link href="${pageContext.request.contextPath}/resources/css/admin.css?after" rel="stylesheet">
</head>
<body>

	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	
	<section>
		<div class="admin_title">
			<p>전체 회원 조회</p>
		</div>
		
		<table class="page_table">
			<col width="15%"/>
			<col width="10%"/>
			<col width="20%"/>
			<col width="20%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="5%"/>
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>탈퇴일자</th>
					<th>정지일자</th>
					<th>권한</th>
				</tr>
			</thead>
			
		<c:forEach items="${list }" var="dto">
			<tbody>
				<tr>
					<td>${dto.member_id }</td>
					<td>${dto.member_name }</td>
					<td>${dto.member_email }</td>
					<td>${dto.member_phone }</td>
					<td>${dto.member_ddate }</td>
					<td>${dto.member_bdate }</td>
					<td>${dto.member_role }</td>
				</tr>
			</tbody>
		</c:forEach>
		
			<tfoot>
				<tr>
					<td colspan="7" style="border:none; text-align:right;">
						<input class="admin_btn" type="button" value="관리자 메인" onclick="location.href='admin.do'">
					</td>
				</tr>
			</tfoot>
		</table>
	</section>
	 
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>
</body>
</html>