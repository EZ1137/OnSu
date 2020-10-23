<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script>
	window.onload = function(){
		 ck = CKEDITOR.replace("editor1");
	};
</script>
</head>
<body>

	<h1>강의 등록</h1>
	
	<table border="1">
		<tr>
			<th>강의명</th>
			<td><input type="text" name="classname"></td>
		</tr>
		<tr>
			<th>강사명</th>
			<td><input type="text" name="teachername"></td>
		</tr>
	</table>
	
	<textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
	
</body>
</html>