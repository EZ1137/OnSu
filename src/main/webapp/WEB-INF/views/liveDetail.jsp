
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/join.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
<script
	src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
<script src="resources/js/getHTMLMediaElement.js"></script>
<script src="resources/js/adapter.js"></script>
<link rel="stylesheet" href="resources/css/broadcast_live.css" />
<!-- <script src="https://kit.fontawesome.com/d28db34e8b.js"
	crossorigin="anonymous"></script>
 -->
 <script>
function loginAlert() {
	alert("로그인 해주세요");
	location.href = "${pageContext.request.contextPath}/login/loginForm.do";
}
</script>
</head>
<body>

	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<input type="hidden" value="${livedto.live_no}" id="live_no">
	<input type="hidden" value="${livedto.live_id}" id="live_id"
		class="live_id">
	<div id="local-videos-container"></div>
	<div id="section2">
		<div id="section2_left">
			<div id="local-videos-container"></div>
			<div class="profileSection-tab-text">
				<div>
					<span id="live_no">${livedto.live_no }</span>
				</div>
				<p id="live_id">jayoung</p>
			</div>
		</div>
	</div>
	<div>
		<button id="disconnect-room" class="chat-btn">
			<i class="fas fa-sign-out-alt"></i>
		</button>
	</div>
	<div id="input-chat">
		<input type="text" id="input-text-chat" placeholder="로그인이 필요합니다"
			onclick=" loginAlert();">
	</div>


	<script src="resources/js/broadcast_detail_rtc.js"></script>
	<script src="resources/js/broadcast_detail.js"></script>


	<!-- footer -->

	<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>

