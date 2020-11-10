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
		<form action="idfind.do" method="post">
		<fieldset id="idfind">
		<table>
		<h3> 아이디 찾기</h3>
			<colgroup>
				<col width="200">
				<col width="350">
			</colgroup>
			<tr>
				<th>이름</th>
				<td>
				<input type="text" name="member_name" id="member_name" placeholder="이름을 입력해주세요">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="member_email" id="member_email" placeholder="이메일을 입력해주세요">
              		<input type="submit">
				</td>
			</tr>	
		</table>
		</fieldset>
		</form>
		
			<br><br>		
			<br><br>		
		
		
		<fieldset id="pwfind">
		<form action="pwfind.do" method="post">
		<table>
			<h3>비밀번호 찾기</h3>
			<colgroup>
				<col width="200">
				<col width="200">
				<col width="200">
			</colgroup>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="member_id"  placeholder="아이디를 입력해주세요"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name"  placeholder="이름을 입력해주세요"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
				<input type="email" name="member_email" id="pw_memberemail" placeholder="이메일을 입력해주세요">
				<input type="submit" >
				</td>
		</table>
		</form>
		</fieldset>
		
		

	</section>
<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

		
</body>
</html>