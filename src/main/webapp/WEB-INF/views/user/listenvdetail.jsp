<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>

	<section>
		<div>
			<form action="reviewInsert.do" method="post">
			<input type="hidden" name="class_no" value="${dto.class_no }"/>
			<input type="hidden" name="member_id" value="${member_id}">
			<table>
				<tr>
					<th>강의 제목</th>
					<td>${dto.class_title }</td>
				</tr>
				<tr>
					<th>강사 ID</th>
					<td>${dto.class_teacherid }</td>
				</tr>
				<tr>
					<th>강사 이름</th>
					<td>${dto.class_teachername }</td>
				</tr>
				<tr>
					<th>강의 정보</th>
					<td>${dto.class_info }</td>
				</tr>
				<tr>
					<th>강의 가격</th>
					<td>${dto.class_price }</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="submit" value="리뷰 작성"/>
					<input type="button" value="뒤로" onclick="location.href='mypage.do'" />
				</tr>
			</table>
			</form>
		</div>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp"%>
		</footer>
	</footer>

</body>
</html>