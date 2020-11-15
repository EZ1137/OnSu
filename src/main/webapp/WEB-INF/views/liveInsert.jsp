<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/live.css"
	rel="stylesheet">
<script
	src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
<script
	src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/adapter.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/getHTMLMediaElement.js"></script>

</head>
<body>
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section>
		<div class="liveContainer">
			<div class="liveTitle">1:1강의를 시작해보세요!</div>
			<form action="liveinsertres.do" method="post">
				<input type="text" value="${class_no }" name="live_no">
				<input type="text" value="jayoung" name="live_id">
				<input type="submit" value="방생성" />
			</form>
		</div>

	</section>

	<!-- footer -->

	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>