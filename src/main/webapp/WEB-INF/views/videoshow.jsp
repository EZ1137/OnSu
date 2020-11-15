<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
    
	<video controls width="1000">
		<source src="http://localhost:8787/image/${videoDto.video_directory }" type="video/mp4">
	</video>
	

</body>
</html>