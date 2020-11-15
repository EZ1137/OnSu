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
		
		<form action="noticeRes.do" method="post">
			<table class="notice_insert">
				<colgroup>
					<col width="15%"/>
					<col width="85%"/>
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="notice_title" style="height:30px;" placeholder="제목을 입력하세요" required="required"/>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="18" cols="103" name="notice_content" placeholder="내용을 입력하세요"></textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="nbtnbar" style="text-align:right;">
							<input type="reset" class="d_btn" value="RESET"/>
							<input type="submit" value="WRITE"/>
							<input type="button" class="l_btn" value="LIST" onclick="location.href='notice.do'"/>
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