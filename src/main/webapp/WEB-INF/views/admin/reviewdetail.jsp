<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/reviewdetail.css" rel="stylesheet" >
</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>

    <section class="section area">
    	<!-- 타이틀 -->
		<div class="review_title">
			<p>강사 인증</p>
		</div>
		
		<div class="review_zone">
			<form action="${pageContext.request.contextPath}admin/reviewupdate.do" method="get">
				<input type="hidden" name="member_id" value="${dto.member_id}"/>
				<table class="review_one">
					<colgroup>
						<col width="20%"/>
						<col width="50%"/>
						<col width="20%"/>
						<col width="10%"/>
					</colgroup>
					<tbody>
						<tr>
							<th>작성자 ID</th>
							<td>${dto.member_id}</td>
							<th>현재 권한</th>
							<td>${dto.member_role}</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" class="rbtnbar" align="right">
								 <select name="member_role">
									<option value="">인증 여부</option>
									<option value="T">인증 완료</option>
									<option value="S">인증 실패</option>
								</select>
								
								<input type="submit" value="인증 완료"/>
								<input type="button" value="목록" onclick="location.href='<c:url value="/admin/reviewlist.do"/>'"/>
								<input type="button" value="관리자 메인" onclick="location.href='<c:url value="/admin/admin.do"/>'">
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
 <script src="${pageContext.request.contextPath}/resources/js/paging.js" type="text/javascript"></script>
</html>