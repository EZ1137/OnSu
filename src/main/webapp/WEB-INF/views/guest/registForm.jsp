<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>onsoo 회원가입</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function idchk(){
	  var memberid = $("#member_id").val().trim();
	console.log(memberid);
	
	if(memberid == null || memberid == ""){
		alert("ID를 작성해주세요");
	}else{
	  
	$.ajax({
		url:"/guest/idchk.do",
		type:"get",
		dataType:"json",
		data:{
			"member_id":$("#member_id").val().trim()
		},
		success: function(data){
			console.log(data);
			alert("성공"+data);
		},
		error: function(){
			alert("통신실패");
		}
		
	});
	}
}	



</script>
</head>
<link href="${pageContext.request.contextPath}/resources/css/registform.css" rel="stylesheet" >
<body>
<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

<section id="content">


	<fieldset id="registform">
		<legend><h3>OnSoo: 회원가입</h3></legend>
		<c:url value="/regist.do" var="addUserUrl" />
		<form:form action="${addUserUrl}" method="POST">
			<table>
				<tr>
					<th>아이디</th>
					<td>
					<input type="text" name="member_id" id="member_id"   placeholder="아이디를 입력해주세요">
					<input type="button" onclick="idchk();" value="중복확인" />
					<p id="id_chk"></p>
					</td>
						
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="member_pw" placeholder="비밀번호 입력해주세요"></td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td><input type="password"  placeholder="비밀번호 확인해주세요"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="member_name" placeholder="이름을 입력해주세요"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td style="text-align: left;">
						남<input type="radio" name="member_gender" value="M" />
						여<input type="radio" name="member_gender" value="F" />
					</td>
				</tr>
				<tr>
					<th>핸드폰번호</th>
					<td><input type="text" onKeyup="inputPhoneNumber(this);" name="member_phone" maxlength="13" style="text-align:center;" /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="member_email"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="member_addr"></td>
				</tr>
				<tr>
					<td><button type="submit">가입하기</button></td>
					<td><a href="<c:url value="/main.do" />">취소</a></td>
				</tr>
			</table>			
		</form:form>
	</fieldset>


</section>


		<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>
		
	
	

</body>
</html>