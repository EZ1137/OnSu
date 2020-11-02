<%@page import="java.util.Calendar"%>
<%@page import="com.kh.onsoo.calendar.model.dto.CalendarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section class="secssion">   	
	<div id="box">
		<form action="calendarUpdateRes.do" method="post">
		<input type="hidden" name="calendar_no" value="${dto.calendar_no }">
			<table id="box_tb" border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="calendar_title" value="${dto.calendar_title }" ></td>
				
			</tr>
			<tr>
				<th>ID</th>
				<td type="text" name="member_id" readonly="readonly">${dto.member_id }</td>
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

</body>
</html>