<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/study.css" rel="stylesheet" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script>
	window.onload = function(){
		 ck = CKEDITOR.replace("editor1" ,{
			 width:"100%",
			 height:"400px",
			 filebrowserImageUploadUrl: '${pageContext.request.contextPath}/imageUpload.do',
			 customConfig: '${pageContext.request.contextPath}/js/lib/ckeditor/config_oboe.js'
		 });
	};
	
	CKEDITOR.editorConfig = function(config) {
		config.resize_dir = 'none';
	};
	
	window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}','${filePath}', '업로드완료');
	
	function showCategory(value) {
		toggle = document.getElementById(value);
		small_category = document.getElementsByClassName("smallcategory");
		
		for(var i=0; i<small_category.length; i++) {
			small_category[i].style.display = "none";
		}
		
		toggle.style.display = "table-row";
	}
	
	
	function insertUpload() {
		var tr = document.getElementById("upload");
		var editor = document.getElementById("editor");
		
		var newUpload = tr.cloneNode(true);
		
		editor.parentNode.insertBefore(newUpload, editor);
		
	}
</script>

<style>
	#IT, #design {
		display: none;
	}
	
</style>

</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
    
	<section class="section area">
    	<!-- 타이틀 -->
		<div class="free_board_title">
			<p>동영상 강의 등록</p>
		</div>
	
	<form action="studyinsertres.do" method="post" enctype="multipart/form-data">
		<table class="free_insert">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<tr>
				<th>강의명</th>
				<td><input type="text" name="class_title" required="required"></td>
			</tr>
			
			<tr>
				<th>카테고리(하나씩 선택)</th>
				<td>
					<input type="radio" name="class_bigcategory" value="IT" onclick="showCategory(this.value)" required="required">IT			
					<input type="radio" name="class_bigcategory" value="design" onclick="showCategory(this.value)" required="required">디자인
				</td>
			</tr>
			<tr id="IT" class="smallcategory">
			 	
				<!-- 위에 중에 하나 클릭하면 해당 속성에 맞는 카테고리 아래 띄우도록 해보자 -->
				<th>하나 선택</th>
				<td>
					<input type="radio" name="class_smallcategory" value="web" required="required">web
					<input type="radio" name="class_smallcategory" value="algorism" required="required">알고리즘
					<input type="radio" name="class_smallcategory" value="dataStruc" required="required">자료구조
					<input type="radio" name="class_smallcategory" value="comStruc" required="required">컴퓨터 구조
					<input type="radio" name="class_smallcategory" value="network" required="required">네트워크
				</td>
			</tr>
			<tr id="design" class="smallcategory">
				<!-- 위에 중에 하나 클릭하면 해당 속성에 맞는 카테고리 아래 띄우도록 해보자 -->
				<th>하나 선택</th>
				<td>
					<input type="radio" name="class_smallcategory" value="photoshop" required="required">포토샵
					<input type="radio" name="class_smallcategory" value="editor" required="required">에디터
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="class_price" required="required"></td>
			</tr>
			<tr id="upload">
				<th>썸네일 및 이미지</th>
				<td><input multiple="multiple" type="file" value="파일 선택" name="file" required="required" accept=".gif, .jpg, .png"/> <input type="button" value="+" onclick="insertUpload()"/> </td>
			</tr>
			<tr id="editor">
				<td colspan="2" class="free_content">
					<textarea id="editor1" name="class_info" required="required"></textarea>
				</td>
			</tr>
			<tfoot>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록">
					<input type="button" value="목록" onclick="location.href='/onsoo/studylist.do'">
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