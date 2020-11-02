<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/noticeAll.css" rel="stylesheet" >
</head>
<style type="text/css">
* {
	margin:0;
	pardding:0;
	
}

h1{
	padding-top: 5%;
}

section{
	padding-top: 5%;
}

h1{
	text-align: center;
	padding-bottom: 5%;
}


table{
  padding-bottom:10%;
  border-collapse: collapse;
  border-spacing: 0 15px;
  border-top: 1px solid #4444444;
  width: 40%;
  margin: 0 auto;
}



</style>

<body>



<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>


	<section>
		<h1>공지사항 수정페이지</h1>
	<form action="updateRes.do" method="post">
		<input type="hidden" name="notice_no" value="${dto.notice_no}"/>
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" readonly="readonly" value="관리자"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text"  name="notice_title" value="${dto.notice_title }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="notice_content" >${dto.notice_content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="location.href='noticedetail.do?notice_no=${dto.notice_no}'">
				</td>
			</tr>
		</table>
	</form>
	</section>
	
	
<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>