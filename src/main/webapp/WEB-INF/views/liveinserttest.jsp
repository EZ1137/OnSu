
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/live.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
<script
	src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/getHTMLMediaElement.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/adapter.js"></script>

<script src="https://kit.fontawesome.com/d28db34e8b.js"
	crossorigin="anonymous"></script>

<script>
function loginAlert() {
	alert("로그인 해주세요");
	location.href = "${pageContext.request.contextPath}/login/loginForm.do";
}
</script>
</head>
<body>

	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	
	<section>
		<div id="section1">
			<div id="room_info">
				<div id="main_title">
					<h2>수업 정보 입력</h2>
				</div>
				<div class="broad_radius">
					<div class="broad" id="broad_tab_1">
						<span>${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</span> <span>님의 수업</span>
						<input type="hidden" id="live_id" name="live_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" readonly="readonly">
					</div>

					<div class="broad" id="live_no">
						<label>방 번호</label>
						<input type="text" id="live_no"
							value="${class_no }"  required="required" />
					</div>

					
					<div class="broad">
						<button id="btn-open-or-join-room" class="goJoinBtn">수업시작</button>
					</div>
				</div>
			</div>
		</div>
<!-- 		<div id="section2_right">
			<div id="chat-output"></div>

			<div id="chat-input">
				<div class="chat-btn-block">
					<div>
						 <button id="close-broadcast">연결 종료</button>
						<button id="disconnect-room" class="chat-btn">
							<i class="fas fa-sign-out-alt"></i>
						</button>
					</div>
				</div>
				<div id="input-chat">
					<input type="text" id="input-text-chat" placeholder="채팅을 입력하세요"
						onclick="loginAlert();">
				</div>
			</div>
		</div> -->
		

	</section>

	<script src="${pageContext.request.contextPath}/resources/js/broadcast_live_rtc.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/broadcast_live.js"></script>
	<!-- footer -->

	<%@ include file="/WEB-INF/views/footer.jsp"%>
	
</body>
</html>

