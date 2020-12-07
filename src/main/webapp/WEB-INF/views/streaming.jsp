<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.onsu.admin.model.dto.AdminDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Su - 1:1 Class</title>
<link href="${pageContext.request.contextPath}/resources/css/streaming.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath}/resources/js/RTCMultiConnection.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/socket.io.js"></script>
</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
    
	<section>
		<!-- 타이틀 -->
		<div class="streaming_title">
			<p>1:1 Streaming Class</p>
		</div>
		
		<div id="inputmenu">
			<input type="text" id="roomid" size=20 placeholder="수업 코드를 입력해주세요" required="required"/>
			<input type="button" class="roombtn" id="btn-open-room" value="OPEN"/>
			<input type="button" class="roombtn" id="btn-join-room" value="JOIN"/>
		</div>
		
		<div class="videozone" style="display: flex; margin-top: 50px;">
			<div id="localvideo"></div>
			<div id="remotevideo"></div>
		</div>
		
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/broadcast.js"></script>

	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>