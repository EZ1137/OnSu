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
	<h1>신고 내용 페이지</h1>
	<form  action="<c:url value="/reportupdate.do" />" method="get">
	<input type="hidden" name="member_id" value="${rdto.report_ided }"/>
	<table border="1">
		<tr>
			<th>작성자 ID</th>
			<td>${rdto.report_id }</td>
		</tr>
		<tr>
			<th>신고 내용</th>
			<td>${rdto.report_content }</td>
		</tr>
		<tr>
			<th>첨부파일<br>미리보기</th>
			<td><embed class="previewimg" src="./resources/img/${rdto.report_filename }" type="application/pdf" width="500px" height="500px" /></td>
		</tr>
		<tr>
			<th>신고 받은 사람</th>
			<td>${rdto.report_ided }</td>
		</tr>
		<tr>
			<th>신고일</th>
			<td>${rdto.report_date }</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="date" name="member_bdate" />
				<select name="member_role">
					<option >-----선택-----</option>
					<option value="S">강사자격 정지</option>
					<option value="B">회원자격 정지</option>
				</select>
				<input type="submit" value="수정완료">
				<input type="button" value="목록" onclick="location.href='<c:url value="/admin/reportlist.do"/>'"/>
			</td>
		</tr>
		
	</table>
	</form>
	</body>
</html>