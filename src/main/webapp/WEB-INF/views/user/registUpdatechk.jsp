<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/registUpdatechk.css" rel="stylesheet">
</head>
<body>

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	
	<section>
		<div class="chkzone">
			<form action="registUpdate.do" method="get">
				<table id="pwbox">
					<tr>
						<th>
							<h3>${dto.member_id }님의 이메일을 입력해주세요.</h3>
							<input type="hidden"  name="member_id" value="${dto.member_id }"/>
						</th>
					</tr>
					<tr>
						<td style="padding-top:60px;text-align:center;">
							<input type="email" class="chkinput" placeholder="이메일을 입력해주세요" name="member_email" required="required"/>
							<input type="submit" class="submitbtn" value="확인"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>