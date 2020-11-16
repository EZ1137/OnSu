<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/msg.css?after" rel="stylesheet">
</head>
<body>

	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section>
		<div>
			<form action="sendMSGRes.do" method="post">
			<input type="hidden" name="member_id" value="${member_id }">
				<table class="insert">
					<tr>
						<th>받는 사람 ID</th>
						<td><input type="text" name="msg_toid" placeholder="상대방의 ID를 입력해주세요."/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="msg_content" style="resize:none; width:100%; height:300px;" placeholder="내용을 입력하세요."></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:right;">
							<input type="button" value="취소" onclick="location.href='message.do'">
							<input type="submit" value="보내기">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>