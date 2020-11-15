<%@page import="com.kh.onsoo.utils.Utils"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/mypage.css?after"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

	<%
		Calendar cal = Calendar.getInstance();

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;

	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");

	if (paramYear != null) {
		year = Integer.parseInt(paramYear);
	}

	if (paramMonth != null) {
		month = Integer.parseInt(paramMonth);
	}

	if (month > 12) {
		year++;
		month = 1;
	}

	if (month < 1) {
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
		<div class="htitle">
			<p>나의 온수</p>
		</div>
		<div class="mypageBox">
			<div class="ldiv">
				<div class="myp_subtitle">수강 중인 강의 목록</div>
				<table class="list">
					<%-- <colgroup>
						<col width="70%" />
						<col width="30%" />
					</colgroup> --%>
					<tr>
						<th>강의 제목</th>
						<th>강의 횟수/시작일</th>
					</tr>
					<c:choose>
						<c:when test="${empty lwlist && empty lvlist }">
							<tr>
								<td>수강 중인 강의가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${lwlist }" var="listenWithDto">
								<tr>
									<td style="text-align: left;">
									<a
										href="with/studydetail.do?class_no=${listenWithDto.listen_wclassno }&member_id=${mlist.member_id}">${listenWithDto.listen_wclasstitle}</a></td>
									<td style="text-align: left;">${listenWithDto.listen_wcount }</td>
								</tr>
							</c:forEach>
							<c:forEach items="${lvlist }" var="listenVideoDto">
								<tr>
									<td style="text-align: left;"><a
										href="video/studydetail.do?class_no=${listenVideoDto.listen_vclassno }&member_id=${mlist.member_id}">${listenVideoDto.listen_vclasstitle}</a></td>
									<td style="text-align: left;">${listenVideoDto.listen_vdate }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
					<div class="rdiv">
						<jsp:useBean id="utils" class="com.kh.onsoo.utils.Utils" />
						<div class="myp_subtitle">오늘, 내일 남은 일정</div>
						<table style="width: 100%;">

							<tr>
								<th>일정</th>
								<th>시간</th>
							</tr>
							<tr>
								<c:choose>
									<c:when test="${empty callist }">
										<tr>
											<td colspan="2" style="font-weight: bold;">오늘, 내일은 일정이
												없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${callist }" var="calendardto">
											<tr>
												<td style="text-align: left;"><a style="color: blue;"
													href="calendarDetail.do?calendar_no=${calendardto.calendar_no }">${calendardto.calendar_title }</a>
												</td>
												<td><jsp:setProperty property="toDates" name="utils"
														value="${calendardto.calendar_mdate }" /> <jsp:getProperty
														property="toDates" name="utils" /></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tr>
						</table>
					</div>
			</div>
			

			<div class="rdiv">
				<div class="myp_subtitle">${mlist.member_id }님의강의일정</div>
				<div class="cdiv">
					<table class="ldiv" id="cal">
						<caption>
							<a href="mypage.do?year=<%=year - 1%>&month=<%=month%>">◀◀</a> <a
								href="mypage.do?year=<%=year%>&month=<%=month - 1%>">◁</a> <span
								class="y"><%=year%></span>년 <span class="m"><%=month%></span>월 <a
								href="mypage.do?year=<%=year%>&month=<%=month + 1%>">▷</a> <a
								href="mypage.do?year=<%=year + 1%>&month=<%=month%>">▶▶</a>
						</caption>
						<tr>
							<th>일</th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th>토</th>
						</tr>
						<tr>
							<%
								// 공백
							for (int i = 0; i < dayOfWeek - 1; i++) {
								out.println("<td>&nbsp</td>");
							}

							for (int i = 1; i <= lastDay; i++) {
							%>
							<td><a class="countView"
								href="calendarListView.do?year=<%=year%>&month=<%=month%>&date=<%=i%>&member_id=${mlist.member_id }"
								style="color:<%=Utils.fontColor(i, dayOfWeek)%>"><%=i%></a> <a
								href="calendarInsert.do?year=<%=year%>&month=<%=month%>&date=<%=i%>&lastday=<%=lastDay%>&member_id=${mlist.member_id }">
									<img alt="일정 추가" src="resources/img/pen.png" width="10"
									height="10" />
							</a></td>
							<%
								if ((dayOfWeek - 1 + i) % 7 == 0) {
								out.println("<tr></tr>");
							}
							}

							// 뒤 쪽 공백
							for (int i = 0; i < (7 - (dayOfWeek - 1 + lastDay) % 7) % 7; i++) {
							out.println("<td>&nbsp</td>");
							}
							%>
						
					</table>
				
				</div>
			</div>
		</div>

	</section>

	<!-- footer -->
	<footer id="footerarea" class="area">

		<%@ include file="/WEB-INF/views/footer.jsp"%>

	</footer>

	<!-- 알림(새로고침 시) -->
	<div>
		<%@ include file="/WEB-INF/views/noti.jsp"%>
	</div>
</body>
</html>














