<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - Member List</title>
<style>
	#nav.paging{
	
	display:flex;
	justify-content:center;
	align-items:center;
	
}
</style>
<link href="${pageContext.request.contextPath}/resources/css/admin.css?after" rel="stylesheet">
</head>
<body>

	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	
	
	
	<section>
	<div id="products">
		<form action="" id="setRows">
				<input type="hidden" name="rowPerPage" value="20">
		</form>
		<div class="admin_title">
			<p>전체 회원 조회</p>
		</div>
		
		<table class="page_table">
			<colgroup>
				<col width="15%"/>
				<col width="10%"/>
				<col width="20%"/>
				<col width="20%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="5%"/>
			</colgroup>
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>생년월일</th>
					<th>가입일자</th>
					<th>권한</th>
				</tr>
			</thead>
			
		<c:forEach items="${list }" var="dto">
			<tbody>
				<tr class="eval-contents">
					<td>${dto.member_id }</td>
					<td>${dto.member_name }</td>
					<td>${dto.member_email }</td>
					<td>${dto.member_phone }</td>
					<td>${dto.member_birth }</td>
					<td>${dto.member_regdate }</td>
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
		</div>
	</section>
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>
</body>
 <script src="${pageContext.request.contextPath}/resources/js/paging.js"
			type="text/javascript"></script>
</html>