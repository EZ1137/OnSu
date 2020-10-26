
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
						<a class="sideAsset" href="about.do"><p>A B O U T</p></a>
						<a class="sideAsset" href="#"><p>V I D E O</p></a>
						<a class="sideAsset" href="#"><p>1 : 1 C L A S S</p></a>
						<a class="sideAsset" href="faq.do"><p>F A Q</p></a>
						<a class="sideAsset" href="notice.do"><p>N O T I C E</p></a>
						<a class="sideAsset" href="contact.do"><p>C O N T A C T</p></a>
						<a class="sideAsset" href="admin.do"><p>A D M I N</p></a>
					</div>
				</div>
			</nav>
		</div>
	</div>

</body>
</html>

	
				
				