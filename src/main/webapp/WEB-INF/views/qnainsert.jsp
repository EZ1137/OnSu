<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kh.onsoo.qna.model.dto.QnaDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - FAQ</title>
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
		<table class="qna_insert">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			
			<thead>
				<tr>
					<th>Q.</th>
					<td colspan="3"><input type="text" value="${qnadto.qnatitle}"></td>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td colspan="4" class="qcontents">
						<textarea rows="10" cols="122">${qnadto.qnaqcontent}</textarea>
					</td>
				</tr>
			</tbody>
			
			<tfoot>
				<tr>
					<td colspan="6" style="text-align:right;">
						<input type="button" value="LIST" onclick="location.href='qna.do'"/>
						<input type="button" value="RESET" onclick="location.href='qnaupdateform.do?qnano=${qnadto.qnano}'"/>
						<input type="button" value="WRITE" onclick="location.href='qnadelete.do?qnano=${qnadto.qnano}'"/>
					</td>
				</tr>
			</tfoot>
		</table>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>