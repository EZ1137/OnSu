
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css?after"
	rel="stylesheet">
<body>

	<div>
		<div class="wrapper">
			<div id="header-bar" onclick="location.href='main.do'">
				<span> On:Soo </span>
			</div>
			<nav>
				<!-- 통합검색 -->
				<form id="searchzone" action="classsearch.do" method="post">
					<input type="hidden" name="" value="">
					<input type="hidden" name="" value=""> 
					<input type="hidden" name="" value="">
					<input type="text" name="" id="" required="required" placeholder="찾으시는 강의 검색"> 
					<span class="search">
						<button class="searchbtn" type="submit">검색</button>
					</span>
				</form>
				
				<ul class="header-menu">
					<li>
						<a href="#">
							<span class="login">
								<button id="loginbtn">Log in</button>
							</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span class="regist">
								<button id="registbtn">Register</button>
							</span>
						</a>
					</li>
				</ul>
				
				<div class="hamburger"><i class="fas fa-bars"></i></div>
				
				<div id="mySidenav" class="sidenav">
					<a href="#"><p>H O M E</p></a>
					<a href="studylist.do"><p>V I D E O</p></a>
					<a href="#"><p>1 : 1 C L A S S</p></a>
					<a href="faq.do"><p>F A Q</p></a>
					<a href="notice.do"><p>N O T I C E</p></a>
					<a href="contact.do"><p>C O N T A C T</p></a>
					<a href="admin.do"><p>A D M I N</p></a>
				</div>
			</nav>
		</div>
	</div>

</body>
</html>

	
				
				