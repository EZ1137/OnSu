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
	
	function delChk(class_no) {
		if (confirm("삭제하시겠습니까?")) {
			location.href="studydelete.do?class_no=" + class_no;
		}
	}
</script>
<body>

	<header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
    
    <section>
	<!-- Page Content -->
		<div class="main">
	
			<!-- Post Content Column -->
			<div class="div_middle">
	
				<!-- Title -->
				<h4>${studyDto.class_no }</h4>
				<h6># ${studyDto.class_bigcategory } &nbsp # ${studyDto.class_smallcategory }</h6>
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
									<li class="swiper-slide" style="text-align: center;">
										<img style="width:600px; height:400px; margin-top:30px;" class="slideimg" src="<spring:url value='http://localhost:8787/image/${dto.image_directory }'/>" />
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
	
					<table id="detail">
						<colgroup>
							<col width="15%">
							<col width="65%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<tr>
							<th>번호</th>
							<th>타이틀</th>
							<th></th>
							<th></th>
						</tr>
	
						<c:choose>
							<c:when test="${empty videoList	 }">
								<tr>
									<th colspan="4">----------------- 준비 중입니다
										-------------------</th>
								</tr>
	
							</c:when>
	
							<c:otherwise>
								<c:forEach items="${videoList }" var="dto" varStatus="status">
									<tr>
										<td>${status.count}</td>
										<td><a href="javascript:void(0);" onclick="videoShow(${dto.video_no}); return false;">${dto.video_title}</a></td>
										<td><input type="button" value="수정"
											onclick="location.href='videoupdate.do?video_no=${dto.video_no }&class_no=${studyDto.class_no }'"></td>
										<td><input type="button" value="삭제"
											onclick="location.href='videodelete.do?video_no=${dto.video_no }&class_no=${studyDto.class_no }'"></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
	
						<tr>
							<td colspan="4" style="text-align: right;">
								<input type="button" value="비디오 등록" onclick="location.href='videoform.do?class_no=${studyDto.class_no}'">
							</td>
						</tr>
					</table>
	
					<hr/>
					<hr/>
	
				</div>
				<div class="div_side">
	
					<!-- Side Widget -->
					<div class="card my-4">
						<h5 class="card-header">수업 신청</h5>
						<h5>1개월 수강권</h5>
						<h6>${studyDto.class_price }원/월</h6>
						<h6></h6>
						<div class="card-body"></div>
					</div>
					<div class="btns">
						<div>
							<button class="btn btn-primary"
								onclick="location.href='studyupdate.do?class_no=${studyDto.class_no}'">수정</button>
							<button class="btn btn-primary"
								onclick="delChk(${studyDto.class_no})">삭제</button>
							<button class="btn btn-primary"
								onclick="location.href='https://localhost:9001'">수업방 생성</button>
						</div>
					</div>
				</div>
			</div>
	</section>
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
