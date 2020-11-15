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
<link rel="stylesheet"
   href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/onsooMain.js?"
   defer></script>
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/study.css"
	rel="stylesheet">
<link
   href="${pageContext.request.contextPath}/resources/css/blog-post.css"
   rel="stylesheet">

<script type="text/javascript">

$(function () {
   
   $('.starRev span').click(function(){
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        var star = $(this).children().val();
        $("#starVal").prop("value",star);
        
        console.log($("#starVal").val());
        
      });
   
   $('.starRev span').click(function () {
   })
   
});

function videoShow(video_no) {
	var url = "videodetail.do?video_no=" + video_no;
	window.open(url, "", "width=1020, height=800, left=500");
}

</script>

</head>

<body>
	<header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
  
	<!-- Page Content -->
	<div class="main">
		<!-- Post Content Column -->
		<div class="div_middle">
			<!-- Title -->
			<h6># ${studyDto.class_bigcategory } &nbsp # ${studyDto.class_smallcategory }</h6>
			<h1 class="mt-4">${studyDto.class_title }</h1>
			
			<!-- Date/Time -->
			<p>${studyDto.class_teachername } 튜터</p>
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
									<img style="width: 60%; height: 40%; margin-top:30px;" class="slideimg" src="<spring:url value='http://localhost:8787/image/${dto.image_directory }'/>" />
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
					<col width="70%">
					<col width="20%">
				</colgroup>
				<tr>
					<th>번호</th>
					<th>타이틀</th>
					<th>시간</th>
				</tr>
				
				<c:choose>
					<c:when test="${empty videoList }">
						<tr>
							<th colspan="3">----------------- 준비 중입니다 ------------------- </th>
						</tr>
						
					</c:when>
					
					<c:otherwise>
						<c:forEach items="${videoList }" var="dto" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="javascript:void(0);" onclick="videoShow(${dto.video_no}); return false;">${dto.video_title}</a></td>
								<td>${dto.video_runtime}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			
			<!-- Comments Form -->
			<div class="reviewContainer">
				<div class="container">
					<form name="reviewInsertForm">
						<div class="input-group">
							<div class="starRev">
					  			<span class="starR1"><input type="hidden" value="1"/></span>
					  			<span class="starR2"><input type="hidden" value="2"/></span>
					  			<span class="starR1"><input type="hidden" value="3"/></span>
					  			<span class="starR2"><input type="hidden" value="4"/></span>
							 	<span class="starR1"><input type="hidden" value="5"/></span>
								<span class="starR2"><input type="hidden" value="6"/></span>
								<span class="starR1"><input type="hidden" value="7"/></span>
								<span class="starR2"><input type="hidden" value="8"/></span>
								<span class="starR1"><input type="hidden" value="9"/></span>
								<span class="starR2"><input type="hidden" value="10"/></span>
							</div>
							<input type="hidden" id="starVal" name="review_star" value="0"/>
							<input type="hidden" name="member_id" value="${member_id }">
							<input type="hidden" name="review_classno" value="${studyDto.class_no}" />
							<input type="text" class="form-control" id="review_content" name="review_content" placeholder="내용을 입력하세요.">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" name="reviewInsertBtn">등록</button>
							</span>
						</div>
					</form>
				</div>
				
				<div class="container">
					<div class="review"></div>
				</div>

				<!--review.jsp-->
				<%@ include file="/WEB-INF/views/review.jsp" %>
			</div>
		</div>
     <div class="div_side">
      <!-- Side Widget -->
      <div class="card my-4">
         <h5 class="card-header">수업 신청</h5>
         <h5>1개월 수강권</h5>
         <h6>${studyDto.class_price }원/월</h6>
         <div class="card-body">
         </div>
      </div>
		<c:choose>
			<c:when test="${payDto ne null }">
			</c:when>
			<c:otherwise>
				<div class="btns">
					<div>
						<button class="btn btn-primary" onclick="location.href='#'">찜</button>
						<button class="btn btn-primary" onclick="location.href='pay.do?pay_classno=${studyDto.class_no }'">결제</button>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

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
