<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kh.onsoo.admin.model.dto.AdminDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - Q&amp;A</title>
<link href="${pageContext.request.contextPath}/resources/css/qna.css" rel="stylesheet" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>

    <section class="section area">
    	<!-- 타이틀 -->
		<div class="qna_board_title">
			<p>Q&amp;A</p>
		</div>
		
		<!-- 게시글 작성하기 -->
		<form action="<c:url value="/qnainsertres.do" />" method="post">
		<input type="hidden" name="qnawriter" value="${dto.member_id}" />
			<table class="qna_insert">
				<colgroup>
					<col width="15%"/>
					<col width="85%"/>
				</colgroup>
				
				<thead>
					<tr>
						<th>Q.</th>
						<td><input type="text" name="qnatitle" style="height:100%;" placeholder="제목을 입력하세요."/></td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td colspan="2" class="qcontents">
							<textarea rows="10" cols="122" name="qnaqcontent" placeholder="내용을 입력하세요."></textarea>
						</td>
					</tr>
				</tbody>
				
				<tfoot>
					<tr>
						<td colspan="2" style="text-align:right;">
							<input type="button" value="LIST" onclick="location.href='<c:url value="/qna/qna.do" />'"/>
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