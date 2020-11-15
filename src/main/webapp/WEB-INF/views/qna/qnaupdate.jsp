<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kh.onsoo.qna.model.dto.QnaDto" %>
<%@ page import="com.kh.onsoo.admin.model.dto.AdminDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - QnA</title>
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
		
		<!-- 게시글 수정하기 -->
		<!-- 답변 작성 (O) -->
		<c:if test="${qnadto.qnaresponse eq 'Y'}">
			<table class="qna_one" style="margin:80px auto;">
				<tr>
					<th style="height:80px;">이미 답변이 작성되어 수정할 수 없습니다.</th>
				</tr>
				<tr>
					<td style="height:100px;">
						<input type="button" value="LIST" onclick="location.href='qna.do'"/>
						<input type="button" value="DELETE" onclick="location.href='qnadelete.do?qnano=${qnadto.qnano}'"/>
					</td>
				</tr>
			</table>
		</c:if>
		
		<!-- 답변 작성 (X) -->
		<c:if test="${qnadto.qnaresponse eq 'N'}">
			<form action="qnaupdateres.do" method="post">
				<input type="hidden" name="qnano" value="${qnadto.qnano}"/>
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
							<td><input type="text" value="${qnadto.qnawriter}" readonly="readonly"></td>
							<th>DATE</th>
							<td><input type="text" value="${qnadto.qnaqregdate}" readonly="readonly"></td>
						</tr>
						<tr>
							<th>Q.</th>
							<td colspan="3"><input type="text" name="qnatitle" value="${qnadto.qnatitle}"></td>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td colspan="4" class="qcontents">
								<textarea rows="10" cols="122" name="qnaqcontent">${qnadto.qnaqcontent}</textarea>
							</td>
						</tr>
					</tbody>
					
					<tfoot>
						<tr>
							<td colspan="6" style="text-align:right;">
								<input type="button" value="LIST" onclick="location.href='qna/qna.do'"/>
								<input type="reset" value="RESET"/>
								<input type="submit" value="UPDATE"/>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</c:if>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>