<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - Report</title>
<!-- Editor's Dependecy Style -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link href="${pageContext.request.contextPath}/resources/css/reportinsert.css?after" rel="stylesheet">
<script>
	window.onload = function() {
		ck = CKEDITOR
			.replace(
				"editor1",
		{
			filebrowserImageUploadUrl: '${pageContext.request.contextPath}/reportinsertres.do',
			customConfig: '${pageContext.request.contextPath}/js/lib/ckeditor/config_oboe.js'
		});
	};
</script>
</head>
<body>

	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section class="section area">
		<div class="report_board_title">
			<p>신고하기</p>
		</div>
		
		<div class="report_box">
			<form action="reportinsretres.do" method="POST" enctype="multipart/form-data">
				<table class="report_table">
					<colgroup>
						<col width="15%"/>
						<col width="5%"/>
						<col width="15%"/>
						<col width="20%"/>
						<col width="15%"/>
						<col width="20%"/>
					</colgroup>
					<thead>
						<tr>
							<th>카테고리</th>
							<td>
								<select name="report_category" required="required">
									<option value="">선택</option>
									<option value="B">욕설 / 비방</option>
									<option value="T">시간 미준수</option>
									<option value="S">음란 / 외설</option>
									<option value="Q">수업 질 저하</option>
									<option value="P">개인 정보</option>
								</select>
							</td>
							<th>신고자 ID</th>
							<td>
								<c:choose>
									<c:when test="${member_id ne null}">
										<input type="text" name="report_id" readonly="readonly" value="${member_id}"/>
									</c:when>
									<c:otherwise>
										로그인 하세요
									</c:otherwise>
								</c:choose>
							</td>
							<th>신고 대상 ID</th>
							<td>
								<input type="text" name="report_ided" placeholder="ID를 입력하세요" required="required"/>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>내용</th>
							<td colspan="5" class="report title">
								<textarea name="report_content" id="editor1" rows="8" cols="80" placeholder="내용을 입력하세요" required="required"></textarea>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">
								<input type="file" value="파일 선택" name="report_filename"/>
							</td>
							<td style="text-align:right;">
								<input class="reportbtn" type="submit" value="신고 제출"/>
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