<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnSoo</title>
<link
	href="${pageContext.request.contextPath}/resources/css/onsooMain.css"
	rel="stylesheet" >
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/onsooMain.js"
	defer></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<!--CDN 링크 -->
</head>
<body>
	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<!-- main -->
	<section class="section first area">
		<div class="first-wrapper">
			<h1>온수 : 따뜻한 온라인 수업</h1>
			<p class="maintext">font-medium /Lorem ipsum dolor sit amet,
				consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
				labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
				exercit
			</p>
		</div>
	</section>
	<!-- class -->
	<section class="section second area">
		<div class="vod_cards_title">
			<p>동영상 강의</p>
		</div>
		<div class="more_btn">
			<a href="#">더 보기</a>
		</div>
		<div class="class_row">
			<div class="class_card">
				<div class="class_title">
					class_title
				</div>
				<div class="class_info">
					class_info
				</div>
			</div>
			<div class="class_card">
				<div class="class_title">
					class_title
				</div>
				<div class="class_info">
					class_info
				</div>
			</div>
			<div class="class_card">
				<div class="class_title">
					class_title
				</div>
				<div class="class_info">
					class_info
				</div>
			</div>
			<div class="class_card">
				<div class="class_title">
					class_title
				</div>
				<div class="class_info">
					class_info
				</div>
			</div>
		</div><div class="class_row">
			<div class="class_card">
				<div class="class_title">
					class_title
				</div>
				<div class="class_info">
					class_info
				</div>
			</div>
			<div class="class_card">
				<div class="class_title">
					class_title
				</div>
				<div class="class_info">
					class_info
				</div>
			</div>
			<div class="class_card">
				<div class="class_title">
					class_title
				</div>
				<div class="class_info">
					class_info
				</div>
			</div>
			<div class="class_card">
				<div class="class_title">
					class_title
				</div>
				<div class="class_info">
					class_info
				</div>
			</div>
		</div>
	</section>
	<section class="section third area">
		<div class="third-wrapper">best 강의</div>
	</section>
	<section class="section fourth area">
		<div class="fourth-wrapper">강사가 되고싶으신가요?</div>
	</section>
	<section class="section fifth area">
		<div class="fifth-wrapper">
		do you need help?</div>
	</section>

	<footer id="footerarea" class="area"></footer>


	<footer>
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

	<button class="arrow-up">
		<i class="fas fa-arrow-up"></i>
	</button>
</div>
</body>

</html>
