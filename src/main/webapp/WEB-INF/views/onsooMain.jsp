<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnSoo</title>
<meta http-equiv="content-script-type" content="text/javascript">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link
	href="${pageContext.request.contextPath}/resources/css/onsooMain.css?after"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/onsooMain.js?"
	defer></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<style>
video {
	width: 100%;
}
</style>
<script>
	function loginAlert() {
		alert("로그인 해주세요");
		location.href = "${pageContext.request.contextPath}/login/loginForm.do";
	}
	
	setTimeout("location.reload()", 60000);
	
</script>
</head>
<body>

	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<main>
		<div class="swiper-container swiper1">
			<div class="swiper-wrapper">
				<!-- main -->
				<section class="section first area swiper-slide">
					<!-- <div class="first-wrapper">
						<h1>온수 : 따뜻한 온라인 수업</h1>
						<p class="maintext">font-medium /Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercit</p>
					</div> -->
					<!-- 	<div>
					<video muted autoplay loop>
						<source src="Pencil.mp4" type="video/mp4">
					</video>
					</div>
					<div class="first-wrapper">
						<h1>온수 : 따뜻한 온라인 수업</h1>
						<p class="maintext">
						Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercit</p>
					</div> -->
					<div class="first-wrapper">
						<video muted autoplay loop>
							<source
								src="${pageContext.request.contextPath}/resources/video/Coffee.mp4"
								type="video/mp4">
						</video>
						<div class="maintext">
							<p class="maintTitle"
								style="font-size: 62px; font-weight: bold; color: white; text-shadow: 2px 2px 4px var(- -color-light-grey);">
								On:Soo</p>
							<p class="subTitle"
								style="font-size: var(- -font-regular); color: white; margin: 4px 0 40px 0;">
								당신의 가장 따뜻한 온라인 수업</p>
							<p class="nonTitle"
								style="font-size: var(- -font-medium); color: white; line-height: 40px; text-shadow: 1px 1px 2px var(- -color-light-grey);">
								제약을 넘어 가르침과 배움을 잇는 학습 플랫폼,<br> <b>온수</b>와 함께 하세요 :D
							</p>
						</div>
					</div>

				</section>

				<!-- class -->
				<section class="section second area swiper-slide">
					<div class="vod_cards_title">
						<p>동영상 강의</p>
						<span class="more_btn" onclick="location.href='/video/studylist.do'">강의 더 보기</span>
					</div>
					<div class="class_row">
						<div class="class_card class1">
							<div class="class_title">
								<p>class_title</p>
							</div>
						</div>
						<div class="class_card class2">
							<div class="class_title">
								<p>class_title</p>
							</div>
						</div>
						<div class="class_card class3">
							<div class="class_title">
								<p>class_title</p>
							</div>
						</div>
						<div class="class_card class4">
							<div class="class_title">
								<p>class_title</p>
							</div>
						</div>
					</div>
					<div class="class_row">
						<div class="class_card class5">
							<div class="class_title">
								<p>class_title</p>
							</div>
						</div>
						<div class="class_card class6">
							<div class="class_title">
								<p>class_title</p>
							</div>
						</div>
						<div class="class_card class7">
							<div class="class_title">
								<p>class_title</p>
							</div>
						</div>
						<div class="class_card class8">
							<div class="class_title">
								<p>class_title</p>
							</div>
						</div>
					</div>
				</section>

				<section class="section third area swiper-slide">
					<div class="rtc_main_area">
						<p>실시간 스트리밍 강의</p>
						<input type="button" class="more_rtc" value="수강하기" onclick="location.href='streaming.do'"/>
					</div>
				</section>
				<section class="section fourth area swiper-slide">
					<div class="fourth-wrapper">
						<div class="fourth-inner01">
							<div class="fourth-title">선생님이 되어 보세요 :)</div>
							<div class="fourth-inner-box">
								강사 인증 후, <br />수업을 시작할 수 있습니다.
							</div>
							<hr>
							<span class="validate"> <input type="button"
								class="validatebtn" value="인증하러 가기"
								onclick="location.href='teacherupload.do'">
							</span>
						</div>
						<div class="fourth-inner02">
							<div class="swiper-container swiper2">
								<ul class="swiper-wrapper">
									<li class="swiper-slide">
										<div>
											<h3>1. 회원 가입</h3>
											<span>온수에 가입하세요!</span>
										</div> <img class="slideimg" src="resources/img/11.jpg" />
									</li>

									<li class="swiper-slide">
										<div>
											<h3>2. 간단한 인증</h3>
											<span>온수는 안전한 인증시스템을 제공합니다 :)</span>
										</div> <img class="slideimg" src="resources/img/22.jpg" />
									</li>

									<li class="swiper-slide">
										<div>
											<h3>3. 인증 심의 과정</h3>
											<span>온수에서는 안전한 강의를 위해 심의를 거칩니다 :)</span>
										</div> <img class="slideimg" src="resources/img/33.jpg" />
									</li>

									<li class="swiper-slide">
										<div>
											<h3>4. 인증 완료</h3>
											<span>안전한 강의를 위한 심의가 완료 되었습니다 :)</span>
										</div> <img class="slideimg" src="resources/img/44.jpg" />
									</li>

									<li class="swiper-slide">
										<div>
											<h3>5. 준비 끝!</h3>
											<span>온수와 함께 즐거운 수업을 시작하세요 :)</span>
										</div> <img class="slideimg" src="resources/img/55.jpg" />
									</li>
								</ul>

								<div class="swiper-button-next" id="next"></div>
								<div class="swiper-button-prev" id="previous"></div>

								<!-- 페이징 -->
								<div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
				</section>

				<section class="section fifth area swiper-slide">
					<div class="fifth-wrapper">
						<div class="fifth-title">
							저희의 도움이 <br>필요하신가요?
						</div>
						<div class="fifth-sub">
							궁금한 점이 있다면 언제든 연락 주세요!
							<c:choose>
								<c:when
									test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username ne null }">
									<div>
										<input type="button" class="reportbtn" value="신고하러 가기" onclick="location.href='reportinsert.do?member_id=${dto.member_id}'"/>
										<input type="button" class="contactbtn" value="문의하러 가기" onclick="location.href='contact.do'"/>
									</div>
								</c:when>
								<c:otherwise>
									<div>
										<button onclick="loginAlert()" class="contactbtn">문의하러가기</button>
									</div>
								</c:otherwise>

							</c:choose>
						</div>
					</div>

					<footer>
						<%@ include file="/WEB-INF/views/footer.jsp"%>
					</footer>

				</section>
			</div>
		</div>

		<!-- Swiper JS -->
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

		<!-- Initialize Swiper -->
		<script>
			new Swiper('.swiper1', {
				direction : 'vertical',
				slidesPerView : 1,
				spaceBetween : 30,
				mousewheel : true
			});

			new Swiper('.swiper2', {
				slidesPerView : 1,
				spaceBetween : 30,
				loop : true,
				pagination : {
					el : '.swiper-pagination',
					clickable : true,
				},
				navigation : {
					nextEl : '.swiper-button-next',
					prevEl : '.swiper-button-prev',
				}
			});
		</script>
	</main>
</body>

<!-- 알림(새로고침 시) -->
<div>
	<%@ include file="/WEB-INF/views/noti.jsp"%>
</div>

</html>