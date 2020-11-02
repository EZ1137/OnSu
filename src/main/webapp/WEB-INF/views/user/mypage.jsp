<%@page import="com.kh.onsoo.utils.Utils"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css?after" rel="stylesheet" >

</head>
<body>

<%
	Calendar cal = Calendar.getInstance();

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	if(paramYear != null) {
		year = Integer.parseInt(paramYear);
	} 
	
	if(paramMonth != null) {
		month = Integer.parseInt(paramMonth);
	}
	
	if(month > 12) {
		year++;
		month = 1;
	}
	
	if(month < 1) {
		year--;
		month = 12;
	}
	
	// 현재년도, 현재월, 1일 셋팅
	cal.set(year, month - 1, 1);
	
	// 1일의 요일
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	// 마지막 일
	int lastDay = cal.getActualMaximum(cal.DAY_OF_MONTH);

%>

	<!-- header -->
    <header id="header" class="area">
    	<%@ include file="/WEB-INF/views/header.jsp"%>
    </header>
	
	<section>
		<div class="mypage_title">
			<h1>나의 온수<a href="">개인 정보 수정</a></h1>
		</div>
		<div class="ldiv">
			<h1>수강 중인 강의 목록</h1>
			<table>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<th>수강 중인 강의가 없습니다.</th>
						</tr>	
					</c:when>
					<c:otherwise>
					<c:forEach items="${list }" var="listendto">
						<tr>
							<td></td>
							<td></td>
							<td><a href=""></a></td>
							<td></td>
						</tr>
					</c:forEach>
					</c:otherwise>	
				</c:choose>
			</table>
		</div>
		
		<div class="rdiv">
			<h1>강의 일정</h1>
			<div>
				<table id="calendar" border="1" >
				<caption>
					<a href="mypage.do?year=<%=year-1%>&month=<%=month%>">◀◀</a>
					<a href="mypage.do?year=<%=year%>&month=<%=month-1%>">◁</a>
		
					<span class="y"><%=year %></span>년
					<span class="m"><%=month %></span>월
			
					<a href="mypage.do?year=<%=year%>&month=<%=month+1%>">▷</a>
					<a href="mypage.do?year=<%=year+1%>&month=<%=month%>">▶▶</a>
				</caption>
				<tr>
					<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
				</tr>
				<tr>
				<%
				// 공백
				for(int i = 0; i < dayOfWeek-1; i++) {
					out.println("<td>&nbsp</td>");
				}

				for(int i = 1; i <= lastDay; i++) {
				%>
				<td>
					<a class="countView" href="calendarListView.do?year=<%=year%>&month=<%=month%>&date=<%=i%>"  style="color:<%=Utils.fontColor(i, dayOfWeek)%>" ><%=i %></a>
				
					<a href="calendarInsert.do?year=<%=year%>&month=<%=month%>&date=<%=i%>&lastday=<%=lastDay%>">
						<img alt="일정 추가" src="resources/img/pen.png" width="10" height="10" />
					</a>
				</td>
				<%
				if((dayOfWeek-1 + i) % 7 == 0) {
					out.println("<tr></tr>");
				}
				}
	
				// 뒤 쪽 공백
				for(int i = 0; i < (7-(dayOfWeek-1 + lastDay)%7)%7; i++) {
					out.println("<td>&nbsp</td>");
				}
				%>
				</table>
			</div>
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














