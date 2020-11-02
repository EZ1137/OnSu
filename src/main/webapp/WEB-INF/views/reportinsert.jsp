<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo-report</title>
<!-- Editor's Dependecy Style -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link
	href="${pageContext.request.contextPath}/resources/css/reportinsert.css?after"
	rel="stylesheet">
</head>
<body>
	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section class="section area">
		<div class="report_board_title">
			<p>신고페이지</p>
		</div>


		<div class="report_box">
			<div class="report_table">
				<form action="reportinsertres.do" method="post">
					<div>
						<div>
							<div class="report no">신고번호</div>
							<div>
								<input type="text" name="report_no">
							</div>
						</div>
						<div>
							<div class="report id">신고자이름</div>
							<div>
								<input type="text" name="report_id"
									value="${logindto.member_id }">
							</div>
						</div>
						<div>
							<div class="report ided">강사이름</div>
							<div>
								<input type="text" name="report_ided">
							</div>
						</div>
						<div>
							<div class="report category">카테고리(하나씩 선택)</div>
							<div>
								<input type="radio" name="report_category" value="B" required>
								욕설/비방 <input type="radio" name="report_category" value="T">
								시간미준수 <input type="radio" name="report_category" value="S">
								음란 <input type="radio" name="report_category" value="Q">
								수업의 질이 떨어짐 <input type="radio" name="report_category" value="P">
								개인정보 관련
							</div>
						</div>
						<div>
							<div class="report title">
								신고내용
								<div>
									<div id="editor"></div>
									<input class="reportbtn" type="submit" name="report_content"  value="신고 제출" onclick="formSubmit()" required>

									<!-- 토스트 ui -->
									<script
										src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
									<script>
										const editor = new toastui.Editor({
											el : document
													.querySelector('#editor'),
											previewStyle : 'tab',
											height : '400px',
											language : 'ko',
											initialEditType : 'wysiwyg'
										});

										function formSubmit() {
											let content = editor.getMarkdown();
											localStorage.setItem("content",
													content);
											location.href = "reportinsertres.jsp";
										}
									</script>

								</div>
							</div>
						</div>


					</div>
				</form>
			</div>
		</div>
	</section>



	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>