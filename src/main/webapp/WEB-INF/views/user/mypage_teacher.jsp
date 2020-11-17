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

	<script type="text/javascript">
		setTimeout("location.reload()", 60000);
	</script>

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
								style="color:<%=Utils.fontColor(i, dayOfWeek)%>"> <%=i%>
							</a> <a
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

			<div class="rdiv">
				<div>
					<div class="myp_subtitle">실시간 강의</div>
					<table class="list">
						<colgroup>
							<col width="6%" />
							<col width="40%" />
							<col width="20%" />
							<col width="24%" />
						</colgroup>

						<thead>
							<tr>
								<th>No.</th>
								<th>TITLE</th>
								<th>Category</th>
							</tr>
						</thead>

						<tbody>

							<c:choose>
								<c:when test="${empty withList }">
									<tr>
										<th colspan="4">------------ 강의가 없습니다 ----------------</th>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${withList }" var="dto">
										<tr>
											<td>${dto.class_no }</td>
											<td><a
												href="with/teacher/studydetail.do?class_no=${dto.class_no}">${dto.class_title }</a></td>
											<td># ${dto.class_bigcategory } #
												${dto.class_smallcategory }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</tbody>

						<tfoot>

							<tr>
								<td colspan="6" class="qbtnbar" style="text-align: right;">
									<input type="button" value="수업 등록"
									onclick="location.href='with/teacher/studyinsert.do'" />
								</td>
							</tr>


						</tfoot>
					</table>
				</div>

				<div>

					<div class="myp_subtitle">동영상 강의</div>
					<table class="list">
						<colgroup>
							<col width="10%" />
							<col width="60%" />
							<col width="30%" />
						</colgroup>

						<thead>
							<tr>
								<th>No.</th>
								<th>TITLE</th>
								<th>Category</th>
							</tr>
						</thead>

						<tbody>

							<c:choose>
								<c:when test="${empty videoList }">
									<tr>
										<th colspan="4">------------ 강의가 없습니다 ----------------</th>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${videoList }" var="dto">
										<tr>
											<td>${dto.class_no }</td>
											<td><a
												href="video/teacher/studydetail.do?class_no=${dto.class_no}">${dto.class_title }</a></td>
											<td># ${dto.class_bigcategory } #
												${dto.class_smallcategory }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</tbody>

						<tfoot>

							<tr>
								<td colspan="6" class="qbtnbar" style="text-align: right;">
									<input type="button" value="수업 등록"
									onclick="location.href='video/teacher/studyinsert.do'" />
								</td>
							</tr>

						</tfoot>
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