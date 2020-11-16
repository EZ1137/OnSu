<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	var videotime = document.getElementById("video");
	console.log(videotime.duration);
</script>

</head>
<body>
	
    
	<form action="videoinsertres.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="class_no" value="${class_no }">
		<table class="free_insert">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			
			<tr>
				<th>동영상 제목</th>
				<td><input type="text" name="videoname" required="required"></td>
			</tr>
			<tr>
				<th>동영상 업로드</th>
				<td><input id="video" type="file" name="file" value="파일 선택" required="required" accept=".mp4"></td>
			</tr>
		
			
			<tr>
				<td><input type="submit" value="업로드"></td>
			</tr>
		</table>
	</form>
</body>
</html>