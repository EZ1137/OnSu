<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free-update</title>
<link
	href="${pageContext.request.contextPath}/resources/css/free.css?after"
	rel="stylesheet">
</head>
<body>

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section class="section area">
		<!-- 타이틀 -->
		<div class="free_board_title">
			<p>FREE-UPDATE</p>
		</div>

		<!-- 게시글 상세보기 -->
		<form action="freeupdateres.do">
			<input type="hidden" name="free_no"
				value="${freeboardDto.free_no }" />
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
						<td><input type="text" 
							value="${freeboardDto.free_writer}" readonly="readonly"></td>
						<th>DATE</th>
						<td><input type="text"
							value="<fmt:formatDate value="${freeboardDto.free_date}" pattern="yyyy-MM-dd" />" readonly="readonly"></td>
					</tr>
					<tr>
						<th>TITLE</th>
						<td colspan="3"><input type="text" name="free_title"
							value="${freeboardDto.free_title}"></td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td colspan="4" class="qcontents"><textarea rows="10"
								cols="122" name="free_content">${freeboardDto.free_content}</textarea></td>
					</tr>
				</tbody>

				<tfoot>
					<tr>
						<td colspan="6" style="text-align: right;">
						<input type="button" value="LIST" onclick="location.href='freelist.do'" />
							<input type="submit" value="EDIT" />
							<input type="button" value="DELETE" onclick="location.href='freedelete.do?free_no=${freeboardDto.free_no}'" />

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