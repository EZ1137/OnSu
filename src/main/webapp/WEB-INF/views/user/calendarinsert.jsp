<%@page import="java.util.Calendar"%>
<%@page import="com.kh.onsoo.calendar.model.dto.CalendarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	CalendarDto cdto = new CalendarDto();
	
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int date = Integer.parseInt(request.getParameter("date"));
	int lastDay = Integer.parseInt(request.getParameter("lastday"));

	Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int min = cal.get(Calendar.MINUTE);
%>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>

	<section>
	<h1>일정 작성</h1>
	<form action="calendarInsertRes.do" method="post">
		<table border="1">
			<tr>
				<th>일정</th>
				<td>
					<select name="year">
<%
					for(int i = year-5; i <= year+5; i++) {
%>						
						<option value="<%=i%>" <%=(year == i)?"selected":"" %>><%=i %></option>
<%
					}
%>
					</select>년
					
					<select name="month">
<%
					for(int i = 1; i < 13; i++) {
%>						
						<option value="<%=i %>" <%=(month == i)?"selected":"" %>><%=i %></option>
<%
					}
%>
					</select>월
					
					<select name="date">
<%
					for(int i = 1; i <= lastDay; i++) {
%>
						<option value="<%=i%>" <%=(date == i)?"selected":"" %>><%=i %></option> 
<%
					}
%>					
					</select>일
					
					<select name="hour">
<%
					for(int i = 0; i < 24; i++) {
%>
						<option value="<%=i%>" <%=(hour == i)?"selected":"" %>><%=i %></option>
<%
					}
%>					
					</select>시
					
					<select name="min">
<%
					for(int i = 0; i < 60; i++) {
%>					
						<option value="<%=i%>" <%=(min == i)?"selected":"" %>><%=i %></option>
<%
					}
%>					
					</select>분
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="calendar_title" /></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="member_id" value="" readonly="readonly"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="60" row="20" name="calendar_content" style="resize:none;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="취소" onclick="location.href='calendarList.do'">
					<input type="submit" value="글등록">
				</td>
			</tr>
		</table>
	</form>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp"%>
		</footer>
	</footer>

</body>
</html>