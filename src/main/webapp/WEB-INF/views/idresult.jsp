<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Su - ID Result Page</title>
<link href="${pageContext.request.contextPath}/resources/css/idresult.css" rel="stylesheet" >
</head>
<body>

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	
	<section>
		<table id="idresult_table">
			<thead>
				<tr>
					<th><h2>${iddto.member_name}님의 아이디는</h2></th>
					<td>${iddto.member_id} 입니다.</td>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td>
						<a href="<c:url value="main"/>">홈으로</a> 
					</td>
					<td>
						<a href="<c:url value="/idpwFind"/>">비밀번호찾기</a>
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