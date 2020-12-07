<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Su - Block Page</title>
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
					<h4><fmt:formatDate value="${dto.member_bdate}" pattern="yyyy-MM-dd" />까지 계정이 정지 되었습니다.</h4>
					 <br><br>
					 <br><br>
					 <p>
					 	자세한 문의는 관리자 메일로 보내주시면 답변 드리겠습니다.
					 	<br><br>
					 	onsu.validate@gmail.com
					 </p>
				</li>
				<li>
					<span>
					<a href="main"><h3>메인</h3></a>
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