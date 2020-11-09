<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.kh.onsoo.admin.model.dto.AdminDto" %>
<!DOCTYPE html>
<html>
<head>
<title>On:Soo - Valid</title>
<link href="${pageContext.request.contextPath}/resources/css/teachervalid.css" rel="stylesheet" >
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
			<tr>
				<td style="text-align:left; padding: 20px 0 30px 80px;">
					<p class="valid_semi_title">
						<br><br><br><br>
						${admindto.member_id}님의 서류가 모두 <b>접수 완료</b> 되었습니다!<br><br>
						운영진의 철저한 검토 이후에, 강사 전환이 이루어지니 대기 해 주세요!
						<br><br><br><br>
					</p>
				</td>
			</tr>
			<tr>
				<td style="display:flex; padding: 10px; border-top:1px solid var(--color-light-grey);">
					<input type="button" value="MAIN" onclick="location.href='main.do'"/>
				</td>
			</tr>
		</table>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>