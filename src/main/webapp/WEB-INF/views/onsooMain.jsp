<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnSoo</title>
<link
	href="${pageContext.request.contextPath}/resources/css/onsooMain.css?after"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/onsooMain.js?"
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
				<p class="maintext">font-medium /Lorem ipsum dolor sit amet,
					consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua. Ut enim ad minim veniam, quis
					nostrud exercit</p>
			</div>
		</section>

		<!-- class -->
		<section class="section second area">
			<div class="vod_cards_title">
				<p>동영상 강의</p>
				<span class="more_btn"> <a href="#">더 보기</a>
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
		</section>

		<section class="section third area">
			<div class="rtc_cards_title">
				<p>실시간 강의</p>
				<span class="more_btn"> <a href="#">더 보기</a>
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
		</section>
		<section class="section fourth area">
			<div class="fourth-wrapper">
				<div class="fourth-inner01">
					<div class="fourth-title">선생님이 되어 보세요 :)</div>
					<div class="fourth-inner-box">강사 인증 후, <br/>수업을 시작할 수 있습니다.</div>
					<hr>
					<span class="validate">
						<button class="validatebtn">인증하러 가기</button>
					</span>
				</div>
				<div class="fourth-inner02">
					<div class="slideshow-container">

						<div class="mySlides fade">
							<div class="numbertext">1 / 3</div>
							<img src="resources/img/img1.jpg" style="width: 100%">
							<div class="text">간편 가입</div>
						</div>

						<div class="mySlides fade">
							<div class="numbertext">2 / 3</div>
							<img src="resources/img/img2.jpg" style="width: 100%">
							<div class="text">강사 인증</div>
						</div>

						<div class="mySlides fade">
							<div class="numbertext">3 / 3</div>
							<img src="resources/img/img3.jpg" style="width: 100%">
							<div class="text">수업을 시작해보세요!</div>
						</div>

					</div>

				</div>
				<br>

				<div style="text-align: center">
					<span class="dot" onclick="currentSlide(1)"></span> <span
						class="dot" onclick="currentSlide(2)"></span> <span class="dot"
						onclick="currentSlide(3)"></span>
				</div>

			</div>
		</section>

		<section class="section fifth area">
			<div class="fifth-wrapper">
				<div class="fifth-title">도움이 필요하세요?</div>
				<div class="fifth-sub">
					궁금한 점이 있다면 언제든 연락해주세요!
					<div>
						<button class="contactbtn">문의하러가기</button>
					</div>
				</div>
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
