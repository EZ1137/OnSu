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

	
			<h1>공지사항 디테일</h1>
		<table>
			<tr>
				<th><h3>작성자</h3></th>
				<td><input type="text" value="관리자" readonly="readonly"></td>
			</tr>
			<tr>
				<th><h3>제목<h3></th>
				<td><input type="text" value="${dto.notice_title}" readonly="readonly"></td>
			</tr>
			<tr>
				<th><h3>내용</h3></th>
				<td><textarea rows="10" cols="60" name="nocontent" readonly="readonly">${dto.notice_content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					
					<sec:authorize access="hasRole('ADMIN')">
						<input type="button" value="수정" 
						onclick="location.href='noticeUpdate.do?notice_no=${dto.notice_no}'"/>
						<input type="button" value="삭제" 
						onclick="location.href='noticedelete.do?notice_no=${dto.notice_no}'"/>
					</sec:authorize>
					
					<sec:authorize access="hasRole('USER')">
						<input type="button" value="목록" 
						onclick="location.href='notice.do'"/>
					</sec:authorize>
				</td>
			</tr>					
		</table>
		
		
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>
		
		
		
		


</body>
</html>