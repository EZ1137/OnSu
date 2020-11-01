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
		
		<!-- 게시글 상세보기 -->
		<table class="qna_one">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			
			<thead>
				<tr>
					<th>WRITER</th>
					<td><input type="text" value="${qnadto.qnaqwriter}" readonly="readonly"></td>
					<th>DATE</th>
					<td><input type="text" value="${qnadto.qnaqregdate}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>Q.</th>
					<td colspan="3"><input type="text" value="${qnadto.qnatitle}" readonly="readonly"></td>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td colspan="4" class="qcontents">
						<textarea rows="10" cols="122" readonly="readonly">${qnadto.qnaqcontent}</textarea>
					</td>
				</tr>
			</tbody>
			
			<c:if test="${qnadto.qnaresponse eq 'Y'}">
				<thead>
					<tr>
						<th>WRITER</th>
						<td><input type="text" value="${qnadto.qnaawriter}" readonly="readonly"></td>
						<th>DATE</th>
						<td><input type="text" value="${qnadto.qnaaregdate}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>A. </th>
						<td colspan="3"><input type="text" value="RE : ${qnadto.qnatitle}" readonly="readonly"></td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td colspan="4" class="qcontents">
							<textarea rows="10" cols="122" readonly="readonly">${qnadto.qnaacontent}</textarea>
						</td>
					</tr>
				</tbody>
			</c:if>
			
			<tfoot>
				<tr>
					<td colspan="6" style="text-align:right;">
						<input type="button" value="LIST" onclick="location.href='qna.do'"/>
						<input type="button" value="EDIT" onclick="location.href='qnaupdateform.do?qnano=${qnadto.qnano}'"/>
						<input type="button" value="DELETE" onclick="location.href='qnadelete.do?qnano=${qnadto.qnano}'"/>
						<input type="button" value="ANSWER" onclick="location.href='qnaanswerform.do?qnano=${qnadto.qnano}'"/>
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