<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kh.onsoo.qna.model.dto.QnaDto" %>
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

		<!-- 게시글 상세보기 -->
		<!-- 비밀글 (O) && 등급 (Admin X) && ID!=작성자 -->
		<c:if test="${(qnadto.qnasecret eq 'Y') && (admindto.member_id ne 'admin') && (qnadto.qnawriter ne admindto.member_id)}">
			<table class="qna_one" style="margin:80px auto;">
				<tr>
					<th style="height:80px;">현재 글은 비밀글입니다.</th>
				</tr>
				<tr>
					<td style="height:100px;">
						<input type="button" value="LIST" onclick="location.href='qna.do'"/>
						<input type="button" value="Log In" onclick="location.href='qna.do'"/>
					</td>
				</tr>
			</table>
		</c:if>
		
		<!-- 비밀글 (X) -->
		<c:if test="${(qnadto.qnasecret eq 'N') || (admindto.member_id eq 'admin') || (qnadto.qnawriter eq admindto.member_id)}">
			<table class="qna_one">
				<colgroup>
					<col width="15%"/>
					<col width="35%"/>
					<col width="15%"/>
					<col width="35%"/>
				</colgroup>
				
				<!-- 본문 -->
				<thead>
					<tr>
						<th>WRITER</th>
						<td><input type="text" value="${qnadto.qnawriter}" readonly="readonly"></td>
						<th>DATE</th>
						<td><input type="text" value="<fmt:formatDate value="${qnadto.qnaqregdate}" pattern="yyyy-MM-dd" />" readonly="readonly"></td>
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
				
				<!-- 답변 작성 (O) -->
				<c:if test="${qnadto.qnaresponse eq 'Y'}">
					<thead>
						<tr>
							<th>WRITER</th>
							<td><input type="text" value="admin" readonly="readonly"></td>
							<th>DATE</th>
							<td><input type="text" value="<fmt:formatDate value="${qnadto.qnaaregdate}" pattern="yyyy-MM-dd" />" readonly="readonly"></td>
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
							<div style="display:flex; align:right; margin-bottom:30px;">
								<input type="button" value="LIST" onclick="location.href='qna.do'"/>
								<!-- 비밀글 기능은 작성자 본인만 -->
								<c:if test="${(qnadto.qnasecret eq 'N') && (qnadto.qnawriter eq admindto.member_id)}">
									<form action="qnasetsecret.do" method="post">
										<input type="hidden" name="qnano" value="${qnadto.qnano}"/>
										<input type="submit" value="SECRET"/>
									</form>
								</c:if>
								<!-- 수정은 작성자 본인만 -->
								<c:if test="${qnadto.qnawriter eq admindto.member_id}">
									<input type="button" value="EDIT" onclick="location.href='qnaupdateform.do?qnano=${qnadto.qnano}'"/>
								</c:if>
								<!-- 삭제는 관리자와 작성자 본인만 -->
								<c:if test="${(admindto.member_id eq 'admin') || (qnadto.qnawriter eq admindto.member_id)}">
									<input type="button" value="DELETE" onclick="location.href='qnadelete.do?qnano=${qnadto.qnano}'"/>
								</c:if>
								<!-- 답변은 관리자만 -->
								<c:if test="${admindto.member_id eq 'admin'}">
									<input type="button" value="ANSWER" onclick="location.href='qnaanswerform.do?qnano=${qnadto.qnano}'"/>
								</c:if>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</c:if>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>