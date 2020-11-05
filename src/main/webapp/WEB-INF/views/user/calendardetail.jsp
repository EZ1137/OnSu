<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>

	<section class="secssion">   	
	<div id="box">
		<form action="calendarUpdate.do" method="post">
		<input type="hidden" name="calendar_no" value="${dto.calendar_no }" />
		<table id="box_tb" border="1">
			<tr>
				<th>제목</th>
				<td type="text" name="calendar_title" readonly="readonly">${dto.calendar_title }</td>
			</tr>
			<tr>
				<th>ID</th>
				<td>${dto.member_id }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea type="text" name="calendar_content" rows="10" cols="70" style="resize:none">${dto.calendar_content }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정" />
					<input type="button" value="삭제" onclick="location.href='calendarDelete.do?calendar_no=${dto.calendar_no }'" />
					<input type="button" value="취소" onclick="location.href='calendarList.do'" />
				</td>	
			</tr>
		</table>
		</form>
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