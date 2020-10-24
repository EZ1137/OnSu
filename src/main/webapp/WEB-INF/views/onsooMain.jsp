<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnSoo</title>
<link
	href="${pageContext.request.contextPath}/resources/css/onsooMain.css?after"
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
	
	<main>
	
		<!-- main -->
		<section class="section first area">
			<div class="first-wrapper">
				<h1>온수 : 따뜻한 온라인 수업</h1>
				<p class="maintext">
					font-medium /Lorem ipsum dolor sit amet,
					consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua. Ut enim ad minim veniam, 
					quis nostrud exercit
				</p>
			</div>
		</section>
		
		<!-- class -->
		<section class="section second area">
			<div class="vod_cards_title">
				<p>동영상 강의</p>
				<span class="more_btn">
					<a href="#">더 보기</a>
				</span>
			</div>
			<div class="class_row">
				<div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div>
				<div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div>
				<div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div>
				<div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div>
			</div>
			<div class="class_row">
				<div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div><div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div><div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div><div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<section class="section third area">
			<div class="rtc_cards_title">
				<p>실시간 강의</p>
				<span class="more_btn">
					<a href="#">더 보기</a>
				</span>
			</div>
			<div class="class_row">
				<div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div><div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div><div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div><div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div>
			</div>
			<div class="class_row">
				<div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div><div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div><div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div><div class="class_card">
					<div class="class_title">
						<p>class_title</p>
						<div class="class_info" onclick="location.href=''">
							<p>자세히 보기</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<section class="section fourth area">
			<div class="fourth-wrapper">
				강사가 되고 싶으신가요?
			</div>
		</section>
		
		<section class="section fifth area">
			<div class="fifth-wrapper">
				do you need help?
			</div>
		</section>
	</main>
	
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

	<button class="arrow-up">
		<i class="fas fa-arrow-up"></i>
	</button>
</body>

</html>
