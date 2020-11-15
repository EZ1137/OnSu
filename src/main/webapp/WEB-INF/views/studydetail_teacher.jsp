<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Onsoo</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/onsooMain.js?"
	defer></script>
<link href="${pageContext.request.contextPath}/resources/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/study.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/blog-post.css" rel="stylesheet">
</head>

<script>
	function videoShow(video_no) {
		var url = "videodetail.do?video_no=" + video_no;
		window.open(url, "", "width=1020, height=800, left=500");
	}
</script>
<body>

	<header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
    
	<!-- Page Content -->
	<div class="main">

		<!-- Post Content Column -->
		<div class="div_middle">

			<!-- Title -->
			<h6># ${studyDto.class_bigcategory } &nbsp #
				${studyDto.class_smallcategory }</h6>
			<h1 class="mt-4">${studyDto.class_title }</h1>

			<!-- Date/Time -->
			<p>${studyDto.class_teachername }튜터</p>

			<hr>
			<hr>
			<!-- Sidebar Widgets Column -->

			<c:choose>
				<c:when test="${empty imageList }">
					
				</c:when>
				
				<c:otherwise>
				<div class="swiper-container swiper2">
					<ul class="swiper-wrapper">
						
							<c:forEach items="${imageList }" var="dto">
								<li class="swiper-slide">
									<img class="slideimg" src="<spring:url value='http://localhost:8787/image/${dto.image_directory }'/>" />
								</li>
							</c:forEach>
						
					</ul>
				
					<div class="swiper-button-next" id="next"></div>
					<div class="swiper-button-prev" id="previous"></div>
				</div>
				</c:otherwise>
			</c:choose>
				<!-- Post Content -->
				<p class="lead">${studyDto.class_info}</p>

				<table>
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="20%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<tr>
						<th>번호</th>
						<th>타이틀</th>
						<th>시간</th>
						<th></th>
						<th></th>
					</tr>

					<c:choose>
						<c:when test="${empty videoList	 }">
							<tr>
								<th colspan="5">----------------- 준비 중입니다
									-------------------</th>
							</tr>

						</c:when>

						<c:otherwise>
							<c:forEach items="${videoList }" var="dto" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td><a href="javascript:void(0);" onclick="videoShow(${dto.video_no}); return false;">${dto.video_title}</a></td>
									<td>${dto.video_runtime}</td>
									<td><input type="button" value="수정"
										onclick="location.href='videoupdate.do?video_no=${dto.video_no }&class_no=${studyDto.class_no }'"></td>
									<td><input type="button" value="삭제"
										onclick="location.href='videodelete.do?video_no=${dto.video_no }&class_no=${studyDto.class_no }'"></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<tr>
						<td colspan="5" style="text-align: right;">
							<input type="button" value="비디오 등록" onclick="location.href='videoform.do?class_no=${studyDto.class_no}'">
						</td>
					</tr>
				</table>

				<hr/>
				<hr/>
				
				<!-- Single Comment -->
				<div class="media mb-4">
					<img class="d-flex mr-3 rounded-circle"
						src="http://placehold.it/50x50" alt="">
					<div class="media-body">
						<h5 class="mt-0">Commenter Name</h5>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin. Cras purus odio, vestibulum in
						vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
						nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
					</div>
				</div>

				<!-- Comment with nested comments -->
				<div class="media mb-4">
					<img class="d-flex mr-3 rounded-circle"
						src="http://placehold.it/50x50" alt="">
					<div class="media-body">
						<h5 class="mt-0">Commenter Name</h5>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin. Cras purus odio, vestibulum in
						vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
						nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

						<div class="media mt-4">
							<img class="d-flex mr-3 rounded-circle"
								src="http://placehold.it/50x50" alt="">
							<div class="media-body">
								<h5 class="mt-0">Commenter Name</h5>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
								scelerisque ante sollicitudin. Cras purus odio, vestibulum in
								vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
								nisi vulputate fringilla. Donec lacinia congue felis in
								faucibus.
							</div>
						</div>

						<div class="media mt-4">
							<img class="d-flex mr-3 rounded-circle"
								src="http://placehold.it/50x50" alt="">
							<div class="media-body">
								<h5 class="mt-0">Commenter Name</h5>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
								scelerisque ante sollicitudin. Cras purus odio, vestibulum in
								vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
								nisi vulputate fringilla. Donec lacinia congue felis in
								faucibus.
							</div>
						</div>

					</div>
				</div>

			</div>
			<div class="div_side">

				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">수업 신청</h5>
					<h5>1개월 수강권</h5>
					<h6>${studyDto.class_price }원/월</h6>
					<div class="card-body"></div>
				</div>
				<div class="btns">
					<div>
						<button class="btn btn-primary"
							onclick="location.href='studyupdate.do?class_no=${studyDto.class_no}'">수정</button>
						<button class="btn btn-primary"
							onclick="location.href='studydelete.do?class_no=${studyDto.class_no}'">삭제</button>
					</div>
				</div>
			</div>
		</div>

		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
		
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

		<!-- Bootstrap core JavaScript -->
		<script
			src="${pageContext.request.contextPath}/resources/css/vendor/jquery/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
