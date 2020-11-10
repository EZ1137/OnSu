<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#pwchk_table{

	padding-top: 10%;
	padding-bottom: 10%;

}
#pwbox{
	padding-left: 40%;
}


</style>
</head>
<body>
<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
<section id="pwchk_table">
	<form action="registUpdate.do" method="get">
	<table id="pwbox">
		<tr>
				<th>
					<h3>${dto.member_id }님의 이메일을 입력해주세요</h3>
					<input type="hidden"  name="member_id" value="${dto.member_id }">
				</th>
		</tr>
		<tr>
			<td>
					<input type="email" placeholder="이메일을 입력해주세여 " name="member_email" required="required" />
					<input type="submit" value="확인">
			</td>
		</tr>
	</table>
	</form>



</section>
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>







</body>
</html>