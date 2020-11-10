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

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/css/blog-post.css"
	rel="stylesheet">
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
			<p>${studyDto.class_teachername } 튜터</p>

			<hr>
			<hr>
			<!-- Sidebar Widgets Column -->

			<!-- Post Content -->
			<p class="lead">${studyDto.class_info}</p>


					
			<!-- Comments Form -->
			<div class="card my-4">
				<h5 class="card-header">Leave a Comment:</h5>
				<div class="card-body">
					<form action="review.do" method="post">
						<div class="form-group">
							<textarea class="form-control" name="" rows="3"></textarea>
						</div>
						<button type="submit" class="btn btn-primary">리뷰 작성</button>
					</form>
				</div>
			</div>
			<!-- Single Comment -->
			<div class="media mb-4">
				<img class="d-flex mr-3 rounded-circle"
					src="http://placehold.it/50x50" alt="">
				<div class="media-body">
					<h5 class="mt-0">Commenter Name</h5>
					Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
					scelerisque ante sollicitudin. Cras purus odio, vestibulum in
					vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
					vulputate fringilla. Donec lacinia congue felis in faucibus.
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
					vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
					vulputate fringilla. Donec lacinia congue felis in faucibus.

					<div class="media mt-4">
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

					<div class="media mt-4">
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
					<button class="btn btn-primary"
						onclick="location.href='#'">찜</button>
					<button class="btn btn-primary"
						onclick="location.href='#'">수강신청</button>
				</div>
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
