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
		 ck = CKEDITOR.replace("editor1" ,{
			 filebrowserImageUploadUrl: '${pageContext.request.contextPath}/ImageUpload.do',
			 customConfig: '${pageContext.request.contextPath}/js/lib/ckeditor/config_oboe.js'
		 });
	};
</script>
</head>
<body>

	<h1>강의 등록</h1>
	
	<form action="studyinsertres.do" method="post">
		<table border="1">
			<tr>
				<th>강의명</th>
				<td><input type="text" name="class_title"></td>
			</tr>
			<tr>
				<th>강사명</th>
				<td><input type="text" name="class_teachername"></td>
			</tr>
			<tr>
				<th>클래스 타입</th>
				<td>
					<input type="radio" name="class_type" value="W">실시간 1:1 과외
					<input type="radio" name="class_type" value="V">동영상 강의
				</td>
			</tr>
			
			<tr>
				<th>카테고리(하나씩 선택)</th>
				<td>
					<input type="radio" name="class_bigcategory" value="IT">IT			
					<input type="radio" name="class_bigcategory" value="design">디자인
				</td>
			</tr>
			<tr>
				<!-- 위에 중에 하나 클릭하면 해당 속성에 맞는 카테고리 아래 띄우도록 해보자 -->
				<th></th>
				<td>
					<input type="radio" name="class_smallcategory" value="web">web
					<input type="radio" name="class_smallcategory" value="algorithm">알고리즘
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="class_price"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="class_info" id="editor1" rows="10" cols="80"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록">
					<input type="button" value="목록" onclick="location.href='studylist.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>