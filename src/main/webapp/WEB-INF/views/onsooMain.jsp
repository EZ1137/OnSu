<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnSoo</title>
<meta http-equiv="content-script-type" content="text/javascript">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/onsooMain.css?after" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/onsooMain.js?" defer></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
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
					<div class="first-wrapper">
						<h1>온수 : 따뜻한 온라인 수업</h1>
						<p class="maintext">font-medium /Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercit</p>
					</div>
				</section>
		
				<!-- class -->
				<section class="section second area swiper-slide">
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
		
				<section class="section third area swiper-slide">
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
				<section class="section fourth area swiper-slide">
					<div class="fourth-wrapper">
						<div class="fourth-inner01">
							<div class="fourth-title">선생님이 되어 보세요 :)</div>
							<div class="fourth-inner-box">
								강사 인증 후, <br />수업을 시작할 수 있습니다.
							</div>
							<hr>
							<span class="validate">
								<input type="button" class="validatebtn" value="인증하러 가기" onclick="location.href='tvalid.do'">
							</span>
						</div>
						<div class="fourth-inner02">
							<div class="swiper-container swiper2">
								<ul class="swiper-wrapper">
									<li class="swiper-slide">
										<div>
											<h3>Slide #1</h3>
											<span>Sub-title #1</span>
										</div> 
										<img src="https://fakeimg.pl/600x400/960a96/000?text=11111">
									</li>
		
									<li class="swiper-slide">
										<div>
											<h3>Slide #2</h3>
											<span>Sub-title #2</span>
										</div> 
										<img src="https://fakeimg.pl/600x400/D27328/000?text=22222">
									</li>
		
									<li class="swiper-slide">
										<div>
											<h3>Slide #3</h3>
											<span>Sub-title #3</span>
										</div> 
										<img src="https://fakeimg.pl/600x400/FF607F/000?text=33333">
									</li>
		
									<li class="swiper-slide">
										<div>
											<h3>Slide #4</h3>
											<span>Sub-title #4</span>
										</div> 
										<img src="https://fakeimg.pl/600x400/0A6E0A/000?text=44444">
									</li>
		
									<li class="swiper-slide">
										<div>
											<h3>Slide #5</h3>
											<span>Sub-title #5</span>
										</div> 
										<img src="https://fakeimg.pl/600x400/0064CD/000?text=55555">
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
						<div class="fifth-title">저희의 도움이 <br>필요하신가요?</div>
						<div class="fifth-sub">
							궁금한 점이 있다면 언제든 연락 주세요!
							<div>
								<a href="reportinsert.do"><button class="contactbtn">문의하러가기</button></a>
							</div>
						</div>
					</div>
					<%@ include file="/WEB-INF/views/footer.jsp"%>
				</section>
			</div>
        </div>
        
        <!-- Swiper JS -->
	    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
	    <!-- Initialize Swiper -->
	    <script>
	        new Swiper('.swiper1', {
	            direction: 'vertical',
	            slidesPerView: 1,
	            spaceBetween: 30,
	            mousewheel: true
	        });
	        
	        new Swiper('.swiper2', {
	        	slidesPerView: 1,
	            spaceBetween: 30,
	            loop: true,
	            pagination: {
	              el: '.swiper-pagination',
	              clickable: true,
	            },
	            navigation: {
	              nextEl: '.swiper-button-next',
	              prevEl: '.swiper-button-prev',
	            }
	        });
	    </script>
	</main>

	<button id="arrow" class="arrow-up" onclick="arrowUp()">
		<i class="fas fa-arrow-up"></i>
	</button>
<%-- 
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer> --%>
</body>

	<!-- 알림(새로고침 시) -->
	<div>
		<%@ include file="/WEB-INF/views/noti.jsp" %>
	</div>

</html>