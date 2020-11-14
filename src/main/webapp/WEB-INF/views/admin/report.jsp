<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - Report List</title>
<style type="text/css">
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
	<div id = "products">
	<form action="" id="setRows">
				<input type="hidden" name="rowPerPage" value="20">
		</form>
		<div class="admin_title">
			<p>신고 회원 조회</p>
		</div>
		
		<table class="page_table">
			<colgroup>
				<col width="20%">
				<col width="30%">
				<col width="20%">
				<col width="15%">
				<col width="5%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>신고자</th>
					<th>제목</th>
					<th>신고대상</th>
					<th>신고일자</th>
					<th>분류</th>
					<th>상세보기</th>
				</tr>
			</thead>
			
		<c:forEach items="${reportlist }" var="dto">
			<tbody>
				<tr class="eval-contents">
					<td>${dto.report_id }</td>
					<td>${dto.report_title }</td>
					<td>${dto.report_ided }</td>
					<td>${dto.report_date }</td>
					<td>${dto.report_category }</td>
					<td class="td_btn" style="border:none;" onclick="location.href='reportdetail.do?report_content=${dto.report_content}'">이동</td>
				</tr>
			</tbody>
		</c:forEach>
		
			<tfoot>
				<tr>
					<td colspan="6" style="border:none; text-align:right;">
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