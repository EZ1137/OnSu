<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Su - Notice</title>
<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet"/>
</head>
<body>

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section>
    	<!-- 타이틀 -->
		<div class="notice_board_title">
			<p>NOTICE</p>
		</div>
		
		<table class="notice_detail">
			<colgroup>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="20%"/>
				<col width="15%"/>
				<col width="20%"/>
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<td>${dto.notice_no}</td>
					<th>작성자</th>
					<td>관리자</td>
					<th>작성일</th>
					<td><fmt:formatDate value="${dto.notice_regdate}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>제목</th>
					<td colspan="5" style="text-align:left; padding-left:16px;">${dto.notice_title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="5">
						<textarea rows="12" cols="103" name="nocontent" readonly="readonly">${dto.notice_content}</textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6" style="text-align:right" class="nbtnbar">
						<sec:authorize access="hasRole('ADMIN')">
							<input type="button" class="e_btn" value="수정" onclick="location.href='noticeUpdate?notice_no=${dto.notice_no}'"/>
							<input type="button" class="d_btn" value="삭제" onclick="location.href='noticedelete?notice_no=${dto.notice_no}'"/>
						</sec:authorize>
						<sec:authorize access="hasRole('USER')">
							<input type="button" value="목록" class="l_btn" onclick="location.href='notice'"/>
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
</html>