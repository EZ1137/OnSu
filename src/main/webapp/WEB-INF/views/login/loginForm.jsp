<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>로그인 페이지</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/loginForm.css" rel="stylesheet" >
<body onload="document.f.id.focus();">
	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

<section id="loginform">
<fieldset id="f">
<legend class="col-form-label col-sm-4 pt-0">
				<h4>Login</h4>
			</legend>
			
<c:url value="/login" var="loginUrl" />
<form:form name="f" action="${loginUrl}" method="POST">
    <c:if test="${param.error != null}">
        <p>아이디와 비밀번호가 잘못되었습니다.</p>
    </c:if>
    <c:if test="${param.logout != null}">
        <p>로그아웃 하였습니다.</p>
    </c:if>
    <p>
        <label for="username">아이디</label>
        <input type="text" id="id" name="id"  class="onlogin"  />
    </p>
    <p>
        <label for="password">비밀번호</label>
        <input type="password" id="password" name="password" class="onlogin" />
    </p>
   	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
    <button type="submit" class="btn">로그인</button>
    <!-- csrf 토근도 같이 전송이 된다. 서버에서 미리 토근을 받아서 체크한다. --> 
</form:form>
	<button>카카오로그인</button>
	<button>네이버 로그인</button>
</fieldset>

</section>
<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>
