<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - Valid</title>
<link href="${pageContext.request.contextPath}/resources/css/teachervalid.css" rel="stylesheet" >
<!-- <script type="text/javascript">
	$("input[type='file']").on("change", function() {
		const selector = this;
		const ext =  selector.files[0].name.substr(selector.files[0].name.lastIndexOf(".") + 1);
		
		if (ext !== "pdf") {
			returnl
		}
	});
</script> -->
</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>

    <section class="section area">
    	<!-- 타이틀 -->
		<div class="valid_title">
			<p>Teacher Validation</p>
		</div>
	
		<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadFile" action="upload">
			<table class="valid_list">
				<thead>
					<tr>
						<td style="text-align:left; padding: 20px 0 30px 80px;">
							<p class="valid_semi_title">
								저희 <b>On:Soo</b>와 <br>
								함께 해 주실 선생님들을 모시기에 앞서, <br>
								서로의 확인을 위해 <b>몇 가지 필요한 서류들</b>이 있어요! <br><br>
								
							</p>
						</td>
					</tr>
					<tr>
						<th style="text-align:left; padding: 10px 10px 10px 60px;">
							<h3>구비 서류 안내</h3>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align:left; padding: 20px 0 20px 80px;">
							<p>
								<b>주민등록등본</b>, <b>졸업(재학)증명서</b>, <b>강의계획서</b>, <b>통장 사본</b> 각 1부<br><br>
								1. 주민등록번호 뒷자리는 나오지 않도록 해 주세요.<br>
								2. 졸업(재학)증명서 또는 경력 등을 증명할 수 있는 포트폴리오, 경력기술서 등의 기타 증빙 서류를 준비 해 주세요.<br>
								3. 수업하실 내용을 알 수 있는 자유 형식의 강의계획서를 보여 주세요.<br>
								4. 추후 정산을 위한 통장 사본 또는 계좌 정보를 알려 주세요.
							</p>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td style="display:flex; padding: 10px; align-items:center; border-top:1px solid var(--color-light-grey);">
							<form name="fileForm" action="tvalidup.do" method="post" enctype="multipart/form-data">
								<input multiple="multiple" type="file" name="file" />
								<input type="text" name="src" />
								<input type="reset" value="RESET" />
								<input type="submit" value="UPLOAD" />
							</form>
						</td>
					</tr>
				</tfoot>
			</table>
		</form:form>
		
		<!-- 
			spring form tag
			form:form, form:errors, form:input, ...
			
			form: errors -> Errors, BindingResult를 사용할 때 
			command객체의 특정 field에서 발생하는 예외에 대한 메시지 출력 가능 
		 -->
		 
		 <!-- 
			enctype 속성 
			1. application/www-form-urlencoded : 문자들이 encoding됨 (default)
			2. multipart/form-data : file upload
			3. text/plain : 문자들을 encoding 하지 않음 
		  -->
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>