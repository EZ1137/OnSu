<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - Admin Report</title>
<link href="${pageContext.request.contextPath}/resources/css/reportdetail.css?after" rel="stylesheet"/>
</head>
<body>

	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section class="section area">
		<div class="report_board_title">
			<p>신고 내용 조회</p>
		</div>
		
		<div class="report_box">
			<form action="<c:url value="/reportupdate.do"/>" method="get">
				<input type="hidden" name="member_id" value="${rdto.report_ided}"/>
				<table class="report_table">
					<colgroup>
						<col width="15%"/>
						<col width="20%"/>
						<col width="15%"/>
						<col width="20%"/>
						<col width="15%"/>
						<col width="15%"/>
					</colgroup>
					<thead>
						<tr>
							<th>신고자 ID</th>
							<td>${rdto.report_id}</td>
							<th>신고 대상 ID</th>
							<td>${rdto.report_ided}</td>
							<th>신고일자</th>
							<td><fmt:formatDate value="${rdto.report_date}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>내용</th>
							<td colspan="5" style="padding-left:10px;">${rdto.report_content}</td>
						</tr>
						<tr>
							<th>첨부 파일</th>
							<td colspan="5">
								<embed class="previewimg" src="./resources/img/${rdto.report_filename}" type="application/pdf"/>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td></td>
							<td colspan="4">
								<select name="member_role">
									<option>조치하기</option>
									<option value="S">강사자격 정지</option>
									<option value="B">회원자격 정지</option>
								</select>
								<input type="submit" class="submitbtn" value="완료"/>
							</td>
							<td align="right">
								<input type="button" class="listbtn" value="목록" onclick="location.href='<c:url value="/admin/reportlist.do"/>'"/>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</section>

	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>