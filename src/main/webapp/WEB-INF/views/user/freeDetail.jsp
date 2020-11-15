<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - FREEE BOARD</title>
<link
	href="${pageContext.request.contextPath}/resources/css/free.css?after"
	rel="stylesheet">
<script>

function delChk(free_no) {
	if (confirm("삭제하시겠습니까?")) {
		location.href="freedelete.do?free_no=${freeboardDto.free_no}";
	}
}
function loginAlert() {
	alert("로그인 해주세요");
	location.href = "${pageContext.request.contextPath}/login/loginForm.do";
}
</script>
</head>
<body>

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section class="section area">
		<!-- 타이틀 -->
		<div class="free_board_title">
			<p>FREE BOARD-SELECT ONE</p>
		</div>

		<!-- 게시글 상세보기 -->
		<table class="free_one">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>

			<thead>
				<tr>
					<th>WRITER</th>
					<td><input type="text" value="${freeboardDto.free_writer}"
						readonly="readonly"></td>
					<th>DATE</th>
					<td><input type="text"
						value="<fmt:formatDate value="${freeboardDto.free_date}" pattern="yyyy-MM-dd" />"
						readonly="readonly"></td>
				</tr>
				<tr>
					<th>TITLE</th>
					<td colspan="3"><input type="text"
						value="${freeboardDto.free_title}" readonly="readonly"></td>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td colspan="4" class="qcontents"><textarea rows="10"
							cols="122" readonly="readonly">${freeboardDto.free_content}</textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6" style="text-align: right;">
					<input type="button" value="LIST" onclick="location.href='freelist.do'" />
					<input type="button" value="EDIT" onclick="location.href='freeupdateform.do?free_no=${freeboardDto.free_no}'" />
					<input type="button" value="DELETE" onclick="delChk(${freeboardDto.free_no});" /></td>
				</tr>
			</tfoot>
		</table>


		<!-- 댓글  -->
		<div class="replycontainer">
		<div class="container">
			<label for="content"></label>
			<form name="replyInsertForm">
				<div class="input-group">
					<input type="hidden" name="reply_boardno" value="${freeboardDto.free_no}" />
					<input type="text" class="form-control" id="reply_title" name="reply_title" placeholder="댓글을 입력하세요.">
					<span class="input-group-btn">
					<c:choose>
							<c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username ne null }">
								<button class="btn btn-default" type="button" name="replyInsertBtn">등록</button>
						</c:when>
						<c:otherwise>
								<button onclick="loginAlert()" class="btn btn-default" type="button" name="replyInsertBtn">등록</button>
						</c:otherwise>
					</c:choose>
					</span>
				</div>
			</form>
		</div>

		<div class="container">
			<div class="replyList"></div>
		</div>

		<!--reply.jsp-->
		<%@ include file="/WEB-INF/views/reply.jsp" %>
		</div>
		

	</section>



	<!-- footer -->
	
		<%@ include file="/WEB-INF/views/footer.jsp"%>



</body>
</html>