<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/study.css" rel="stylesheet" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

</head>
<body>

	<section class="section area">
    	<!-- 타이틀 -->
		<div class="free_board_title">
			<p>1:1 강의 등록</p>
		</div>
	
	<form action="studyupdateres.do" method="post">
		<table class="free_insert">
			<tr>
				<td><input type="text" name="video_name" value="${videoDto.video_name }">
			</tr>
		</table>
	</form>
	</section>
</body>
</html>