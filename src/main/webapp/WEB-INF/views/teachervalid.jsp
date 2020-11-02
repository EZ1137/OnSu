<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - Valid</title>
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
			file<br/>
			<input type="file" name="mpfile"/><br/>
			<p style="color: red; font-weight: bold;"><form:errors path="mpfile"/></p><br/>
			
			description<br/>
			<textarea rows="10" cols="40" name="desc"></textarea><br/>
			<input type="submit" value="send"/>
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