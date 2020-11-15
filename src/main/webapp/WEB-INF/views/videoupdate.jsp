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

	<header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
    
	<section class="section area">
    	<!-- 타이틀 -->
		<div class="free_board_title">
			<p>1:1 강의 등록</p>
		</div>
	
	<form action="videoupdateres.do" method="post">
		<table class="free_update">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<tr>
				<th>동영상 이름</th>
				<td><input type="text" name="video_name" value="${videoDto.video_title}">
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정"/>
			</tr>
		</table>
	</form>
	</section>
</body>
</html>