<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo-report</title>
<link
	href="${pageContext.request.contextPath}/resources/css/reportinsert.css?after"
	rel="stylesheet">
</head>
<body>
	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section class="first">
		<div class="wrapper">
			<div class="report_board_title">신고페이지</div>
			<form action="reportinsertres.do" method="post">

				<div>
					<table border="1">
						<tr>
							<th>신고번호</th>
							<td><input type="text" name="report_no"></td>
						</tr>
						<tr>
							<th>신고자이름</th>
							<td><input type="text" name="report_id"
								value="${logindto.member_id }"></td>
						</tr>
						<tr>
							<th>강사이름</th>
							<td><input type="text" name="report_ided"></td>
						</tr>
						<tr>
							<th>카테고리(하나씩 선택)</th>
							<td><input type="radio" name="report_category" value="B">
								욕설/비방 <input type="radio" name="report_category" value="T">
								시간미준수 <input type="radio" name="report_category" value="S">
								음란 <input type="radio" name="report_category" value="Q">
								수업의 질이 떨어짐 <input type="radio" name="report_category" value="P">
								개인정보 관련</td>
						</tr>
						<tr>
							<th>신고내용</th>
							<td><input type="text" name="report_content"></td>
						</tr>

						<tr>
							<td colspan="2" align="right"><input type="submit"
								value="등록" onclick="">
					</table>
				</div>
			</form>
		</div>

	</section>


	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>