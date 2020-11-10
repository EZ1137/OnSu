<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.onsoo.admin.model.dto.AdminDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/streaming.css" rel="stylesheet" >
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
<script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
    
	<section>
		<!-- 타이틀 -->
		<div class="streaming_title">
			<p>Web-RTC</p>
		</div>
		
		<div id="inputmenu">
			<input type="text" id="roomid" placeholder="수업 코드를 입력해주세요" required="required"/>
			<c:if test="${admindto.member_role eq 'T'}">
				<button id="btn-open">생성하기</button>
			</c:if>
			<button id="btn-join">입장</button>
		</div>
		
		<div style="display: flex; margin-top: 50px;">
			<div id="localvideo"></div>
			<div id="remotevideo"></div>
		</div>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>
	
	<script src="resources/js/real.js"></script>
	
</body>
</html>

