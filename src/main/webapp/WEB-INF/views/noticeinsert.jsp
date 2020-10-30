<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/noticeAll.css" rel="stylesheet" >
</head>
<body>

<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>


<section>
	<h1>공지사항 작성</h1>
	<form action="noticeRes.do" method="post">
		<table>
			<tr>
				<th><h3>제목<h3></th>
				<td><input type="text" name="notice_title"></td>
			</tr>
			<tr>
				<th><h3>내용</h3></th>
				<td><textarea rows="10" cols="60" name="notice_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="완료"/>
					<input type="button" value="취소" onclick="location.href='notice.do'"/>
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