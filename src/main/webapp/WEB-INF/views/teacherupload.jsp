<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>On:Su - Validation</title>
<link href="${pageContext.request.contextPath}/resources/css/teacherupload.css" rel="stylesheet" >
</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>

    <section class="section area">
    	<!-- 타이틀 -->
		<div class="valid_title">
			<p>Teacher Validation</p>
		</div>
	
		<table class="valid_list">
			<thead>
				<tr>
					<td style="text-align:left; padding: 10px 0 10px 80px;">
						<p class="valid_semi_title">
							저희 <b>On:Su</b>와 <br>
							함께 해 주실 선생님들을 모시기에 앞서, <br>
							서로의 확인을 위해 <b>몇 가지 필요한 서류들</b>이 있어요! <br><br>
						</p>
					</td>
				</tr>
				<tr>
					<th style="text-align:left; padding: 10px 10px 10px 60px;">
						<h3>구비 서류 안내</h3>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align:left; padding: 40px 0 40px 80px;">
						<p>
							<b>졸업(재학)증명서</b>, <b>강의계획서</b> 각 1부<br><br>
							1. 졸업(재학)증명서 또는 경력 등을 증명할 수 있는 포트폴리오, 경력기술서 등의 증빙 서류를 준비 해 주세요.<br>
							2. 수업하실 내용을 알 수 있는 자유 형식의 강의계획서를 보여 주세요.
						</p>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td style="display:flex; padding: 40px 0 20px 80px; text-align:left; border-top:1px solid var(--color-light-grey);">
						<p>'강사 인증 - ㅇㅇㅇ'의 제목으로 저희 메일 <b>onsu.validate@gmail.com</b>에 상기 서류들을 첨부해서 보내 주세요.</p>
					</td>
				</tr>
			</tfoot>
		</table>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>