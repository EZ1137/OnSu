<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Onsoo</title>

<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/vendor/bootstrap/css/bootstrap.min.css"
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
	
})

</script>

</head>

<body>

	<!-- Page Content -->
	<div class="main">
		<!-- Post Content Column -->
		<div class="div_middle">
			<!-- Title -->
			<h6># ${studyDto.class_bigcategory } &nbsp # ${studyDto.class_smallcategory }</h6>
			<h1 class="mt-4">${studyDto.class_title }</h1>
			
			<!-- Date/Time -->
			<p>${studyDto.class_teachername } 튜터</p><hr><hr>
				
			<!-- Sidebar Widgets Column -->

			<!-- Post Content -->	
			<p class="lead">${studyDto.class_info}</p>
			
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
		<div class="btns">
			<div>
				<button class="btn btn-primary" onclick="location.href='#'">찜</button>
				<button class="btn btn-primary" onclick="location.href='pay.do?pay_classno=${studyDto.class_no }'">결제</button>
			</div>
		</div>
	</div>
		
	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
</body>

</html>

