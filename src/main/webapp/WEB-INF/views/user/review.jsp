<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">

$(function () {
	$(".starList").each(function(){
		$(this).parent().children($('.starR1')).slice(0, $(this).val()).addClass('on');
		$(this).parent().children($('.starR2')).slice(0, $(this).val()).addClass('on');
	})
});

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

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>

	<section>
		<div>
			<form action="review" method="post">
			<input type="hidden" name="review_classno" value="1" />
			<input type="hidden" name="review_id" value="${member_id }" />
				<table border=1>
					<td>
						<textarea name="" style="resize:none; width:100%; height:100px;" placeholder="내용을 입력하세요."></textarea>
					</td>
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
					<td>
						<input type="submit" value="등록">
					</td>
				</table>
			</form>
		</div>
		<div class="ldiv">
			<table>
				<c:choose>
					<c:when test="${empty relist }">
						<tr>
							<th>등록된 리뷰가 없습니다.</th>
						</tr>	
					</c:when>
					<c:otherwise>
					<c:forEach items="${relist }" var="ReviewDto">
						<tr>
							<td>${ReviewDto.review_id }</td>
							<td><a href="reviewDetail.do?review_no=${ReviewDto.review_no }&member_id=${mlist.member_id }">${ReviewDto.review_content }</a></td>
							<td>
								<div class="starRev">
					  				<span class="starR1" id="s1"><input type="hidden" value="1"/></span>
					  				<span class="starR2" id="s2"><input type="hidden" value="2"/></span>
					  				<span class="starR1" id="s3"><input type="hidden" value="3"/></span>
					  				<span class="starR2" id="s4"><input type="hidden" value="4"/></span>
					 				<span class="starR1" id="s5"><input type="hidden" value="5"/></span>
					  				<span class="starR2" id="s6"><input type="hidden" value="6"/></span>
					  				<span class="starR1" id="s7"><input type="hidden" value="7"/></span>
					  				<span class="starR2" id="s8"><input type="hidden" value="8"/></span>
					  				<span class="starR1" id="s9"><input type="hidden" value="9"/></span>
					  				<span class="starR2" id="s10"><input type="hidden" value="10"/></span>
					 				<input type="hidden" class="starList" value="${ReviewDto.review_star }"/>
								</div>
							</td>
							<td style="text-align:left;">작성일 : <fmt:formatDate value="${ReviewDto.review_date }" pattern="yyyy-MM-dd"/></td>
							<td style="text-align:left;">수정일 : <fmt:formatDate value="${ReviewDto.review_update }" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>				
					</c:otherwise>	
				</c:choose>
			</table>
		</div>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp"%>
		</footer>
	</footer>

</body>
</html>

