<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Access Denied</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/accessDenied.css" rel="stylesheet" >
<body>

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<!-- 내용 입력  -->
	<section>
		<div id="access">
			<p>현재 페이지의 접속 권한이 없습니다. </p>
			<input type="button" class="denybtn" value="메인 페이지로 돌아가기" onclick="location.href='<c:url value="/main.do"/>'"/>
		</div>
	</section>

	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>
