<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - Sign Up</title>

<!--다음 api 주소 같이 있어야 사용가능   -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function sample6_execDaumPostcode() {
		new daum.Postcode({
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== '' && data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.

						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress").focus();
					}
				}).open();
	}
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/registForm.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/registform.css" rel="stylesheet">
</head>
<body>

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	
	<section>
		<div id="content">
			<div id="registform">
				<p class="registTitle">On:Soo 회원가입</p>
				<c:url value="/regist.do" var="addUserUrl" />
				<form:form action="${addUserUrl}" method="POST">
					<table class="generalRegist">
						<colgroup>
							<col width="10%"/>
							<col width="20%"/>
							<col width="15%"/>
							<col width="20%"/>
							<col width="10%"/>
							<col width="25%"/>
						</colgroup>
						<tbody>
							<tr>
								<th class="registLabel">ID</th>
								<td>
									<!-- readonly 다시 넣음! -->
									<input class="onRegist" type="text" name="member_id" id="memberid" required="required" placeholder="아이디를 입력해주세요" readonly="readonly" value="${dto.member_id }">
									<p id="id_chk"></p>
								</td>
								<td colspan="4">
									<input class="registbtn" type="button" onclick="idchk();" value="중복 확인"/>
								</td>
							</tr><tr><td colspan="6" class="line_height"></td></tr>
							
							<tr>
								<th class="registLabel">비밀번호</th>
								<td>
									<input class="onRegist" type="password" id="password1" name="member_pw" placeholder="비밀번호를 입력해주세요" required="required" maxlength="15"/>
								</td>
								<th class="registLabel">비밀번호 확인</th>
								<td>
									<input class="onRegist" type="password" id="password2" name="member_pw_chk" placeholder="비밀번호를 확인해주세요" maxlength="15" required="required" onkeyup="fn_compare_pwd();"/>
								</td>
								<td colspan="2">
									<p id="s_result" style="color:#fe5f55;"></p>
								</td>
							</tr><tr><td colspan="6" class="line_height"></td></tr>
							
							<tr>
								<th class="registLabel">이름</th>
								<td>
									<input class="onRegist" type="text" name="member_name" readonly="readonly" required="required" value="${dto.member_name}"/>
								</td>
								<th class="registLabel">생일</th>
								<td>
									<input class="onRegist" type="date" name="member_birth" required="required" id="member_birth" value="${dto.member_birth}"/>
								</td>
								<th class="registLabel">성별</th>
								<td style="display:flex; padding-left:4px;">
									<p class="genderLabel">남성</p>
									<input type="radio" class="radiobtn" name="member_gender" value="M"/> 
									<p class="genderLabel">여성</p>
									<input type="radio" class="radiobtn" name="member_gender" value="F"/>
								</td>
							</tr><tr><td colspan="6" class="line_height"></td></tr>
							
							<tr>
								<th class="registLabel">연락처</th>
								<td>
									<input class="onRegist" type="text" onKeyup="inputPhoneNumber(this);" placeholder="전화번호를 입력해주세요" name="member_phone" maxlength="13" style="text-align: center;"/>
								</td>
								<th class="registLabel">EMAIL</th>
								<td>
									<input class="onRegist" type="email" name="member_email" id="memberemail" placeholder="이메일을 입력해주세요" required="required" value="${dto.member_email}"/> 
								</td>
								<td colspan="2">
								<!-- 이메일 중복 확인 없앨거면 여기 있는 input 4개 다 지우면 됨! -->
									<input class="registbtn" type="button" onclick="emailchk();" value="중복 확인"/>
									<input class="onRegist" type="text" id="randomchk" onkeyup="codechk();" placeholder="인증번호 입력" style="width:90px;" required="required"/>
									<input type="hidden" pattern="random" id="random"/>	
									<input class="onRegist" type="text" id="e_result" style="color:#fe5f55; border:none; width:60px;" readonly="readonly"/>
								</td>
							</tr><tr><td colspan="6" class="line_height"></td></tr>
							
							<tr>
								<th class="registLabel">주소</th>
								<td colspan="3">
									<input class="onRegist" type="text" onclick="sample6_execDaumPostcode();" id="sample6_postcode" class="addr1" name="member_addr" style="width:100px;" placeholder="우편번호" readonly="readonly"/> 
									<input class="onRegist" type="text" onclick="sample6_execDaumPostcode();" id="sample6_address" class="addr1" name="member_addr" placeholder="주소" readonly="readonly"/>
									<input class="onRegist" type="text" onclick="sample6_execDaumPostcode();" id="sample6_detailAddress" class="addr1" name="member_addr" placeholder="상세주소" required="required"/>
								</td>
								<td colspan="2">
									<input class="registbtn" type="button" onclick="sample6_execDaumPostcode();" id="daumaddr" value="우편번호 찾기"/> 
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr class="registBottom">
								<td colspan="6" style="padding-top:40px;">
									<input type="reset" class="resetbtn" id="reset" value="RESET" onclick="reset_res();"/>
									<input type="submit" class="submitbtn" id="submit" value="JOIN"/>
									<input type="button" class="cancletbtn" id="cancle" onclick="location.href='<c:url value="/main.do"/>'" value="BACK"/>
								</td>
							</tr>
						</tfoot>
					</table>
				</form:form>
			</div>
		</div>
	</section>
	
</body>
</html>