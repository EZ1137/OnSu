<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>로그인 페이지</title>
</head>
<link
	href="${pageContext.request.contextPath}/resources/css/loginForm.css"
	rel="stylesheet">
<body onload="document.f.id.focus();">
	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	<section>
		<div id="loginform">


			<div id="f">
				<div class="loginForm">
					<div class="generalLogin">
						<div  class="loginTitle">Login</div>

						<c:url value="/login" var="loginUrl" />
						<form:form name="f" action="${loginUrl}" method="POST">
							<c:if test="${param.error != null}">
								<p>아이디와 비밀번호가 잘못되었습니다.</p>
							</c:if>
							<c:if test="${param.logout != null}">
								<p>로그아웃 하였습니다.</p>
							</c:if>
							<div>
								<input placeholder="아이디를 입력하세요" type="text" id="id" name="id" class="onlogin" />
							</div>
							<div>
								<input placeholder="비밀번호를 입력하세요" type="password" id="password" name="password" class="onlogin" />
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button type="submit" class="loginbtn">로그인</button>
							<!-- csrf 토근도 같이 전송이 된다. 서버에서 미리 토근을 받아서 체크한다. -->
						</form:form>
											<div class="findId">
						<a href='<c:url value="/idpwFind.do"/>'>아이디/비밀번호찾기</a>
					</div>

					</div>
					<div class="socialLogin">
						<div>
							<a href="${naver}"> <img width="200"
								src="${pageContext.request.contextPath}/resources/img/네이버_아이디로_로그인_완성형_Green.PNG" /></a>
						</div>
						<div>
							<a href="${goolge_url}"><img width="223" 
								src="${pageContext.request.contextPath}/resources/img/구글로그인.png"/></a>
						</div>
					</div>


				</div>
				<div class="forRegist">
					<div>
						<div class="RegistTitle">온수가 처음이신가요?</div>
						<div>간단한 가입 후 이용해보세요</div>
					</div>

					<a href="/registForm.do""><button class="registbtn">가입하러
							가기</button></a>
				</div>
			</div>

		</div>
	</section>

	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>
