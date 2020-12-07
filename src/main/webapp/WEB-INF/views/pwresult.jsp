<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Su - PW Result Page</title>
<link href="${pageContext.request.contextPath}/resources/css/idresult.css" rel="stylesheet"/>
</head>
<body>

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	
	<section>
		<form action="pwchange" method="get">
			<input type="hidden" name="member_id" value="${dto.member_id}"/>
			<table id="idresult_table">
				<thead>
					<tr>
						<th>비밀번호를 새로 입력해주세요.</th>
						<td>
							<input type="text" name="member_pw"/>
							<input type="text"/>
							<span id="result"></span>
						</td>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="2">
							<a href="<c:url value="main"/>">홈으로</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

<!-- 해다 아이디 값만 받아서 벨류값에 넣어두고 다시 리턴하게 만들어서  비밀번호를 이번호로 업데이트 하고 해당 업데이트한것을 비크립트 암호화저장시키고 로그인 창으로 돌린다.
		비밀번호 확인 ,비밀번호 맞추기 맞추면 버튼 나타내기 
  -->

</body>
</html>