<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - FREEE BOARD</title>
<link href="${pageContext.request.contextPath}/resources/css/free.css" rel="stylesheet" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>

    <section class="section area">
    	<!-- 타이틀 -->
		<div class="free_board_title">
			<p>FREE BOARD</p>
		</div>
		
		<!-- 게시글 작성하기 -->
		<form action="freeinsertres.do" method="post">
			<table class="free_insert">
				<colgroup>
					<col width="15%"/>
					<col width="85%"/>
				</colgroup>
				
				<thead>
					<tr>
						<th>FREE BOARD</th>
						<td><input type="text" name="free_title" style="height:100%;" placeholder="제목을 입력하세요."/></td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td colspan="2" class="free_content">
							<textarea rows="10" cols="122" name="free_content" placeholder="내용을 입력하세요."></textarea>
						</td>
					</tr>
				</tbody>
				
				<tfoot>
					<tr>
						<td colspan="2" style="text-align:right;">
							<input type="button" value="LIST" onclick="location.href='freelist.do'"/>
							<input type="reset" value="RESET"/>
							<input type="submit" value="WRITE"/>
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