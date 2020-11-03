<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/idpwFind.css" rel="stylesheet" >
<body>
	

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	<!--내용   -->
	<section id="idpwbox">
		<h3> 아이디 비빌번호찾기창입니다.</h3>
		<fieldset id="idfind">
		<legend>아이디 찾기</legend>
		<table>
			<tr>
			<th>이름</th>
			<td><input type="text" name="member_name" placeholder="이름을 입력해주세요"></td>
			</tr>
			<tr>
			<th>이메일</th>
			<td><input type="email" name="member_email" placeholder="이메일을 입력해주세요"></td>
			</tr>
		</table>
		</fieldset>
		
		<fieldset id="pwfind">
		<legend>비밀번호 찾기</legend>
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="member_id" placeholder="아이디를 입력해주세요"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name" placeholder="이름을 입력해주세요"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="member_email" placeholder="이메일을 입력해주세요"></td>
			</tr>
		</table>
		</fieldset>
		
		

	</section>
<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

		
		
</body>
</html>