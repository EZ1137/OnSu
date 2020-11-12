<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/block.css" rel="stylesheet" >
<body>




<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

<section id="block_box">
		<h1>${dto.member_name}님의 계정은 정지 상태입니다.</h1>
		<div id="block_box_content">
			<ul>
				<li>
				<span>
					<h4>아이디 ${dto.member_id}</h4>
					사유: report 값 갖고 오기 
					날짜 : 2020. 12 .31일까지 정지 (member값 갖고 오기 )
				</span>
				</li>
				<li>
					<span>
					<a href="main.do"><h3>메인</h3></a>
					</span>
				</li>
			</ul>
		</div>
</section>		

	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>



</body>
</html>