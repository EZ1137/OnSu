<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link
	href="${pageContext.request.contextPath}/resources/css/idpwFind.css"
	rel="stylesheet">
<body>


	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	<!--내용   -->
	<section>
		<div class="findbox">
			<div id="idfind">
				<form action="idfind.do" method="post">

					<div class="idfindbox">
						<div class="findtitle">아이디 찾기</div>

						<div>
							<div class="subtitle">이름</div>
							<div>
								<input class="findinput" type="text" name="member_name" id="member_name"
									placeholder="이름을 입력해주세요">
							</div>
						</div>
						<div>
							<div class="subtitle">이메일</div>
							<div>
								<input class="findinput" type="email" name="member_email" id="member_email"
									placeholder="이메일을 입력해주세요"> <input class="idbtn" type="submit">
							</div>
						</div>
					</div>

				</form>
			</div>
		</div>


		<div class="findbox">
			<div id="pwfind">
				<form action="pwfind.do" method="post">
					<div>
						<div class="findtitle">비밀번호 찾기</div>

						<div>
							<div class="subtitle">아이디</div>
							<div>
								<input class="findinput" type="text" name="member_id" placeholder="아이디를 입력해주세요">
							</div>
						</div>
						<div>
							<div class="subtitle">이름</div>
							<div>
								<input class="findinput" type="text" name="member_name" placeholder="이름을 입력해주세요">
							</div>
						</div>
						<div>
							<div class="subtitle">이메일</div>
							<div>
								<input class="findinput" type="email" name="member_email" id="pw_memberemail"
									placeholder="이메일을 입력해주세요"> <input class="pwbtn" type="submit">
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>




	</section>



</body>

<!-- footer -->

<%@ include file="/WEB-INF/views/footer.jsp"%>

</html>