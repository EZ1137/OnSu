<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Su - About Us</title>
<link href="${pageContext.request.contextPath}/resources/css/about.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/about.js?" defer></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>

	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<!--     <section class="section area">
		<div class="about_board_title">
			<p>About Us</p>
		</div>
		
		<div class="about_box">
			<p class="about_mini_title">
				On:Soo는
			</p>
			<p class="about_mini_content">
				온라인 강의의 질을 높이고, 진입 장벽을 낮추기 위해 만들어 졌습니다. <br>
				시간과 장소의 제약 없이 모두가 서로의 지식을 나누고 습득할 수 있는 환경을 만들기 위해 노력합니다.
			</p>
			<p class="about_mini_title">
				AriSoo는
			</p>
			<p class="about_mini_content">
				늘 더 발전하기 위해 가슴이 뜨거운 사람들을 모으고, 최선의 시스템과 인프라를 구축합니다. <br>
			</p>
		</div>
	</section> -->
<!-- 	<section>
		<div class="aboutTitle">
			<h1>
				About<br>On:soo
			</h1>
		</div>
	</section> -->
	<section>
		<div class="container">
			<h1> About <br> On:su</h1>
			<div class="toggle-container">
				<input type="checkbox" id="switch" name="theme"/>
				<label for="switch">Toggle</label>
			</div>

			<p>
				On:Su는 온라인 강의의 질을 높이고, 진입 장벽을 낮추기 위해 만들어 졌습니다.<br>
				시간과 장소의 제약 없이 모두가 서로의 지식을 나누고 습득할 수 있는 환경을 만들기 위해 노력합니다.<br>
				늘 더 발전하기 위해 가슴이 뜨거운 사람들을 모으고, 최선의 시스템과 인프라를 구축합니다.
			</p>
		</div>
	</section>

	<!-- footer -->

	<%@ include file="/WEB-INF/views/footer.jsp"%> 

</body>
</html>