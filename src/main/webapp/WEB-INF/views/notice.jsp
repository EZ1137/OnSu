<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - Notice</title>
<style>
	#nav.paging{
	
	display:flex;
	justify-content:center;
	align-items:center;
	
}
</style>
</head>
<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet" >
<body>

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section class="section area">
	<div id="products">
		<form action="" id="setRows">
				<input type="hidden" name="rowPerPage" value="20">
		</form>
    
    	<!-- 타이틀 -->
		<div class="notice_board_title">
			<p>NOTICE</p>
		</div>
		
		<table id="notice" class="notice_list" style="text-align: center;">
			<colgroup>
				<col width="10%"/>
				<col width="65%"/>
				<col width="10%"/>
				<col width="15%"/>
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
			<c:when test="${empty notice}">
				<tr>
					<th colspan="4">현재 작성된 공지글이 존재하지 않습니다.</th>
				</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${notice }" var="dto">
				<tr class="eval-contents">
					<td>${dto.notice_no}</td>
					<td><a href="noticedetail.do?notice_no=${dto.notice_no}" style="color:black; float:left; padding-left:30px;"> ${dto.notice_title}</a></td>
					<td>관리자</td>
					<td><fmt:formatDate value="${dto.notice_regdate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center" class="nbtnbar">
						<select name="">
							<option value="" selected="selected">제목으로 검색</option>
							<option value="">내용으로 검색</option>
						</select>
						<input type="search" name="" placeholder="검색어를 입력하세요"/>
						<input type="submit" value="검색"/>
						<sec:authorize access="hasRole('ADMIN')">
							<input type="button" class="i_btn" value="작성" onclick="location.href='noticeForm.do'"/>
						</sec:authorize>
					</td>
				</tr>
			</tfoot>
		</table>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
 <script src="${pageContext.request.contextPath}/resources/js/paging.js"
			type="text/javascript"></script>
</html>