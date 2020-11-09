<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">

$(function () {
	
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  var star = $(this).children().val();
		  $("#starVal").prop("value",star);
		  
		  console.log($("#starVal").val());
		  
		});
	
	$('.starRev span').click(function () {
	})
	
})

</script>

</head>
<body>
	
	<h1>리뷰 작성</h1>
	<form action="reviewInsertRes.do" method="post">
	<input type="hidden" name="review_classno" value="1" />
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="review_id" value="${member_id }" readonly="readonly"></td>
			<tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="60" row="20" name="review_content" style="resize:none;"></textarea></td>
			</tr>
			<tr>
				<th>별점</th>
				<td>
					<div class="starRev">
					  <span class="starR1"><input type="hidden" value="1"/></span>
					  <span class="starR2"><input type="hidden" value="2"/></span>
					  <span class="starR1"><input type="hidden" value="3"/></span>
					  <span class="starR2"><input type="hidden" value="4"/></span>
					  <span class="starR1"><input type="hidden" value="5"/></span>
					  <span class="starR2"><input type="hidden" value="6"/></span>
					  <span class="starR1"><input type="hidden" value="7"/></span>
					  <span class="starR2"><input type="hidden" value="8"/></span>
					  <span class="starR1"><input type="hidden" value="9"/></span>
					  <span class="starR2"><input type="hidden" value="10"/></span>
					</div>
					<input type="hidden" id="starVal" name="review_star" value="0"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="작성">
					<input type="button" value="취소" onclick="location.href='mypage.do'">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>