<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Su - Message</title>
<link href="${pageContext.request.contextPath}/resources/css/msg.css?after" rel="stylesheet">
</head>
<body>

	<!-- header -->
	<header id="header" class="area">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	
	<section>
		<div class="htitle">
			<p>쪽지함</p>
			<input type="button" value="쪽지 보내기" onclick="location.href='sendMSG.do?member_id=${member_id }'">
		</div>
		<div class="msgBox">
		<div class="ldiv">
			<table class="list">
				<colgroup>
					<col width="15%">
					<col width="50%">
					<col width="10%">
					<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th>보낸 사람</th>
						<th>내용</th>
						<th>확인</th>
						<th>받은 날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty toList eq null }">
							<tr>
								<td colspan="4">받은 쪽지가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${toList }" var="toList">
								<tr>
									<td>${toList.msg_fromid }</td>
									<td>${toList.msg_content }</td>
									<td>${toList.msg_read }</td>
									<td>${toList.msg_date }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
			
		<div class="rdiv">
			<table class="list">
				<colgroup>
					<col width="20%">
					<col width="55%">
					<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th>받은 사람</th>
						<th>내용</th>
						<th>보낸 날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty fromList eq null }">
							<tr>
								<td colspan="3">보낸 쪽지가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${fromList }" var="fromList">
								<tr>
									<td>${fromList.msg_toid }</td>
									<td>${fromList.msg_content }</td>
									<td>${fromList.msg_date }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		</div>
	</section>
	
	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>