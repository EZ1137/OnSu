<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<p>1:1 강의 등록</p>
		</div>
	
	<form action="studyupdateres.do" method="post">
		<table class="free_insert">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<tr>
				<th>강의명</th>
				<td><input type="text" name="class_title" value="${studyDto.class_title }"></td>
			</tr>
			<tr>
				<th>강사명</th>
				<!-- 로그인 정보 받아서 거기서 이름 받아 넣어주자 -->
				<td><input type="text" name="class_teachername" value="${studyDto.class_teachername }" readonly="READONLY"></td>
			</tr>
			
			<tr>
				<th>카테고리(하나씩 선택)</th>
				<td>
					<c:choose>
						<c:when test="${studyDto.class_bigcategory eq 'IT' }" >
							<input type="radio" name="class_bigcategory" value="IT" onclick="showCategory(this.value)" checked="checked">IT			
							<input type="radio" name="class_bigcategory" value="design" onclick="showCategory(this.value)">디자인
						</c:when>
						<c:when test="${studyDto.class_bigcategory eq 'design' }" >
							<input type="radio" name="class_bigcategory" value="IT" onclick="showCategory(this.value)">IT			
							<input type="radio" name="class_bigcategory" value="design" onclick="showCategory(this.value)" checked="checked">디자인
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr id="IT" class="smallcategory">
				<!-- 위에 중에 하나 클릭하면 해당 속성에 맞는 카테고리 아래 띄우도록 해보자 -->
				<th>하나 선택</th>
				<td>
					<c:choose>
						<c:when test="${studyDto.class_smallcategory eq 'web' }">
							<input type="radio" name="class_smallcategory" value="web" checked="checked">web
							<input type="radio" name="class_smallcategory" value="algorism">알고리즘
							<input type="radio" name="class_smallcategory" value="dataStruc">자료구조
							<input type="radio" name="class_smallcategory" value="comStruc">컴퓨터 구조
							<input type="radio" name="class_smallcategory" value="network">네트워크
						</c:when>
						<c:when test="${studyDto.class_smallcategory eq 'algorism' }">
							<input type="radio" name="class_smallcategory" value="web">web
							<input type="radio" name="class_smallcategory" value="algorism" checked="checked">알고리즘
							<input type="radio" name="class_smallcategory" value="dataStruc">자료구조
							<input type="radio" name="class_smallcategory" value="comStruc">컴퓨터 구조
							<input type="radio" name="class_smallcategory" value="network">네트워크
						</c:when>
						<c:when test="${studyDto.class_smallcategory eq 'dataStruc' }">
							<input type="radio" name="class_smallcategory" value="web">web
							<input type="radio" name="class_smallcategory" value="algorism">알고리즘
							<input type="radio" name="class_smallcategory" value="dataStruc" checked="checked">자료구조
							<input type="radio" name="class_smallcategory" value="comStruc">컴퓨터 구조
							<input type="radio" name="class_smallcategory" value="network">네트워크
						</c:when>
						<c:when test="${studyDto.class_smallcategory eq 'comStruc' }">
							<input type="radio" name="class_smallcategory" value="web">web
							<input type="radio" name="class_smallcategory" value="algorism">알고리즘
							<input type="radio" name="class_smallcategory" value="dataStruc">자료구조
							<input type="radio" name="class_smallcategory" value="comStruc" checked="checked">컴퓨터 구조
							<input type="radio" name="class_smallcategory" value="network">네트워크
						</c:when>
						<c:when test="${studyDto.class_smallcategory eq 'network' }">
							<input type="radio" name="class_smallcategory" value="web">web
							<input type="radio" name="class_smallcategory" value="algorism">알고리즘
							<input type="radio" name="class_smallcategory" value="dataStruc">자료구조
							<input type="radio" name="class_smallcategory" value="comStruc">컴퓨터 구조
							<input type="radio" name="class_smallcategory" value="network" checked="checked">네트워크
						</c:when>
						<c:otherwise>
							<input type="radio" name="class_smallcategory" value="web">web
							<input type="radio" name="class_smallcategory" value="algorism">알고리즘
							<input type="radio" name="class_smallcategory" value="dataStruc">자료구조
							<input type="radio" name="class_smallcategory" value="comStruc">컴퓨터 구조
							<input type="radio" name="class_smallcategory" value="network">네트워크
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr id="design" class="smallcategory">
				<!-- 위에 중에 하나 클릭하면 해당 속성에 맞는 카테고리 아래 띄우도록 해보자 -->
				<th>하나 선택</th>
				<td>
					<c:choose>
						<c:when test="${studyDto.class_smallcategory eq 'photoshop' }">
							<input type="radio" name="class_smallcategory" value="photoshop" checked="checked">포토샵
							<input type="radio" name="class_smallcategory" value="editor">에디터
						</c:when>
						<c:when test="${studyDto.class_smallcategory eq 'editor' }">
							<input type="radio" name="class_smallcategory" value="photoshop" >포토샵
							<input type="radio" name="class_smallcategory" value="editor" checked="checked">에디터
						</c:when>
						<c:otherwise>
							<input type="radio" name="class_smallcategory" value="photoshop" >포토샵
							<input type="radio" name="class_smallcategory" value="editor">에디터
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="class_price" value="${studyDto.class_price }"></td>
			</tr>
			<tr>
				<td colspan="2" class="free_content">
					<textarea id="editor1" name="class_info">${studyDto.class_info }</textarea>
				</td>
			</tr>
			<tfoot>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정">
					<input type="button" value="목록" onclick="location.href='studydetail.do?class_no=${studyDto.class_no}'">
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