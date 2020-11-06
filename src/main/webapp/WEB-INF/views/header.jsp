<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.onsoo.admin.model.dto.AdminDto" %>
<%@ page import="com.kh.onsoo.admin.model.dto.AuthDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css?after" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	function menu() {
	    if ($('#mySidenav').css('display') == 'none') {
		    $('#mySidenav').show();
		    
		} else {
		    $('#mySidenav').hide();
		}
	}
</script>
</head>
<body>

	<div>
		<div class="wrapper">
			<div id="header-bar" onclick="location.href='${pageContext.request.contextPath}/main.do'">
				<span> On:Soo </span>
			</div>
			<nav>
				<!-- 통합검색 -->
				<form id="searchzone" action="classSearch.do">
					<input type="hidden" name="class_title" value="class_title">
					<input type="text" name="search" id="headsearch" required="required" placeholder="찾으시는 강의를 검색하세요"> 
				</form>
				
				
				<ul class="header-menu">
				<!-- 권한 없을시 페이지   -->
				
					<c:if test="${admindto eq null}">

						<li>
							<a href="<c:url value="/login/loginForm.do" />">
								<span class="login">
									<button id="loginbtn">Log In</button>
								</span>
							</a>
						</li>
						<li>
							<a href="<c:url value="/registForm.do" />">
								<span class="regist">
									<button id="registbtn">Sign Up</button>
								</span>
							</a>
						</li>
					</c:if>
					<c:if test="${admindto ne null}">
						<c:if test="${authdto.author eq 'ROLL_USER'}">
							<li>
								<a href="<c:url value="/login/loginForm.do" />">
									<span class="login">
										<button id="loginbtn">Log Out</button>
									</span>
								</a>
							</li>
							<li>
								<a href="<c:url value="/guest/registForm.do" />">
									<span class="regist">
										<button id="registbtn">My Page</button>
									</span>
								</a>
							</li>
						</c:if>
						<c:if test="${authdto.author eq 'ROLL_ADMIN'}">
							<li>
								<a href="<c:url value="/login/loginForm.do" />">
									<span class="login">
										<button id="loginbtn">Log Out</button>
									</span>
								</a>
							</li>
							<li>
								<a href="<c:url value="/registForm.do" />">
									<span class="regist">
										<button id="registbtn">Admin Page</button>
									</span>
								</a>
							</li>
						</c:if>
					</c:if>
				</ul>
				<div class="sidenav">
					<i id="hamburger" class="fas fa-bars fa-2x" onclick="menu()"></i>
					<div id="mySidenav">
						<p class="sideAsset" onclick="location.href='about.do'">A B O U T</p>
						<p class="sideAsset" onclick="location.href=''">V I D E O</p>
						<p class="sideAsset" onclick="location.href='streaming.do'">1 : 1 C L A S S</p>
						<p class="sideAsset" onclick="location.href='qna.do'">Q n A</p>
						<p class="sideAsset" onclick="location.href='notice.do'">N O T I C E</p>
						<p class="sideAsset" onclick="location.href='contact.do'">C O N T A C T</p>
						<p class="sideAsset" onclick="location.href='admin.do'">A D M I N</p>
						<p class="sideAsset" onclick="location.href='mypage.do'">M Y P A G E</p>
						<p class="sideAsset" onclick="location.href='freelist.do'">F R E E</p>
					</div>
				</div>
			</nav>
		</div>
	</div>

</body>
</html>
