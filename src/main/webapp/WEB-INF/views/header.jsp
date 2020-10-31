
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css?after"
	rel="stylesheet">
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
			<div id="header-bar" onclick="location.href='main.do'">
				<span> On:Soo </span>
			</div>
			<nav>
				<!-- 통합검색 -->
				<form id="searchzone" action="classsearch.do" method="post">
					<input type="hidden" name="" value="">
					<input type="text" name="" id="" required="required" placeholder="찾으시는 강의를 검색하세요"> 
				</form>
				
				<ul class="header-menu">
					<li>
						<a href="#">
							<span class="login">
								<button id="loginbtn">Log In</button>
							</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span class="regist">
								<button id="registbtn">Sign Up</button>
							</span>
						</a>
					</li>
				</ul>
				<div class="sidenav">
					<i id="hamburger" class="fas fa-bars fa-2x" onclick="menu()"></i>
					<div id="mySidenav">
						<p class="sideAsset" onclick="location.href='about.do'">A B O U T</p>
						<p class="sideAsset" onclick="location.href=''">V I D E O</p>
						<p class="sideAsset" onclick="location.href=''">1 : 1 C L A S S</p>
						<p class="sideAsset" onclick="location.href='faq.do'">F A Q</p>
						<p class="sideAsset" onclick="location.href='notice.do'">N O T I C E</p>
						<p class="sideAsset" onclick="location.href='contact.do'">C O N T A C T</p>
						<p class="sideAsset" onclick="location.href='admin.do'">A D M I N</p>
						<p class="sideAsset" onclick="location.href='mypage.do'">M Y P A G E</p>
					</div>
				</div>
			</nav>
		</div>
	</div>

</body>
</html>

	
				
				