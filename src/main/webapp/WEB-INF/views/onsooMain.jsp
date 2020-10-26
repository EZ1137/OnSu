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
					<div class="fourth-inner-box">
						강사 인증 후, <br />수업을 시작할 수 있습니다.
					</div>
					<hr>
					<span class="validate">
						<button class="validatebtn">인증하러 가기</button>
					</span>
				</div>
				<div class="fourth-inner02">
					<div id="slider-wrap">
						<ul id="slider">
							<li>
								<div>
									<h3>Slide #1</h3>
									<span>Sub-title #1</span>
								</div> <img src="https://fakeimg.pl/350x200/960a96/000?text=11111">
							</li>

							<li>
								<div>
									<h3>Slide #2</h3>
									<span>Sub-title #2</span>
								</div> <img src="https://fakeimg.pl/350x200/D27328/000?text=22222">
							</li>

							<li>
								<div>
									<h3>Slide #3</h3>
									<span>Sub-title #3</span>
								</div> <img src="https://fakeimg.pl/350x200/FF607F/000?text=33333">
							</li>

							<li>
								<div>
									<h3>Slide #4</h3>
									<span>Sub-title #4</span>
								</div> <img src="https://fakeimg.pl/350x200/0A6E0A/000?text=44444">
							</li>


							<li>
								<div>
									<h3>Slide #5</h3>
									<span>Sub-title #5</span>
								</div> <img src="https://fakeimg.pl/350x200/0064CD/000?text=55555">
							</li>
						</ul>
						<div class="slider-btns" id="next">
							<span>▶</span>
						</div>
						<div class="slider-btns" id="previous">
							<span>◀</span>

						</div>

						<div id="slider-pagination-wrap">
							<ul>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="section fifth area">
			<div class="fifth-wrapper">
				<div class="fifth-title">도움이 필요하신가요?</div>
				<div class="fifth-sub">
					궁금한 점이 있다면 언제든 연락 주세요!
					<div>
						<a href="reportinsert.do"><button class="contactbtn">문의하러가기</button></a>
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
