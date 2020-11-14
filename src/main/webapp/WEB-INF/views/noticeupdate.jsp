<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet" >
</head>
<body>

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section>
    	<!-- 타이틀 -->
		<div class="notice_board_title">
			<p>NOTICE</p>
		</div>
		
		<form action="updateRes.do" method="post">
			<input type="hidden" name="notice_no" value="${dto.notice_no}"/>
			<table class="notice_insert">
				<colgroup>
					<col width="15%"/>
					<col width="85%"/>
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="notice_title" value="${dto.notice_title }" required="required"/>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="18" cols="103" name="notice_content" required="required">${dto.notice_content}</textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="nbtnbar" style="text-align:right;">
							<input type="reset" value="RESET"/>
							<input type="submit" value="EDIT"/>
							<input type="button" value="LIST" class="l_btn" onclick="location.href='noticedetail.do?notice_no=${dto.notice_no}'"/>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>