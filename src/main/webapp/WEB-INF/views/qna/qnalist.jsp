<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.kh.onsoo.qna.model.dto.QnaDto" %>
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
		
		<!-- 게시판 목록 -->
		<table class="qna_list">
			<colgroup>
				<col width="6%"/>
				<col width="60%"/>
				<col width="10%"/>
				<col width="24%"/>
			</colgroup>
			
			<thead>
				<tr>
					<th>No.</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
				</tr>
			</thead>
			
			<tbody>
				<c:choose>
					<c:when test="${empty qna}">
						<tr>
							<td colspan="5" align="center">현재 작성된 Q&amp;A 글이 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${qna}" var="qnadto">
							<tr>
								<td>${qnadto.qnano}</td>
								<td style="height:100%; display:flex; padding-left:10px;">
									<c:if test="${qnadto.qnasecret eq 'Y'}">
										<p>
											<i id="list_icon" class="fas fa-lock fa-lg"></i>
										</p>
									</c:if>
									<a href="qnaone.do?qnano=${qnadto.qnano}">${qnadto.qnatitle}</a>
									<c:if test="${qnadto.qnaresponse eq 'Y'}">
										<p>
											<i id="list_icon" class="fas fa-comments fa-lg"></i>
										</p>
									</c:if>
									<c:if test="${qnadto.qnaresponse eq 'N'}">
										<p>
											<i id="list_icon" class="fas fa-comment fa-lg"></i>
										</p>
									</c:if>
								</td>
								<td>${qnadto.qnawriter}</td>
								<td><fmt:formatDate value="${qnadto.qnaqregdate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			
			<tfoot>
				<tr>
					<sec:authorize access="hasAnyRole('ADMIN','USER' )">
					<td colspan="6" class="qbtnbar" style="text-align:right;">
						<input type="button" value="WRITE" onclick="location.href='qnainsertform.do'"/>
					</td>
					</sec:authorize>
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