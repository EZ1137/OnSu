//아이디 중복체크 
function idchk() {
	 var memberid = $("#memberid").val().trim();
	 
	 console.log(memberid);
	 
	 if (memberid == null || memberid == "") {
		 alert("ID를 입력해주세요.");
	 } else {
		 $.ajax({
			 url:"idChk.do",
			 type:"post",
			 data:{
               "member_id": memberid
           },
			 success:function(data){
				 console.log(data);
				if (data == 1) {
					alert("중복된 ID입니다.");
				} else {
					alert("사용 가능한 ID입니다.");
				}
			 },
			 error: function(data){
				 console.log(data);
			 }
		 });
	 }
	 
	}

//이메일 중복체크 
function emailchk() {
	 var memberemail = $("#memberemail").val().trim();
	 
	 console.log(memberemail);
	 
	 if (memberemail == null || memberemail == "") {
		 alert("이메일을 입력해주세요.");
	 } else {
		 $.ajax({
			 url:"emailchk.do",
			 type:"post",
			 data:{
              "member_email": memberemail
          },
			 success:function(data){
				 if (data != null) {
					 alert("사용 가능한 이메일 입니다.\n\n입력된 이메일로 인증번호를 발송했습니다.");
					 $("#random").val(data);
					 $("#randomchk").show();
					 $("#randomname").show();
				 } else {
					 alert("이메일을 다시 입력해주세요.");
				 }
			 },
			 error: function(data){
				 console.log(data);
				 alert("데이터 실패");
			 }
		 });
	 }
	 
	}


// 인증번호 체크 
// ran, userran 비교 처리
var compare_res = false;
function codechk() {
	var ran = $("#random").val();
	var userran = $("#randomchk").val().trim();
	
	console.log(ran);
	console.log(userran);
	
	if (ran != userran) {
		compare_res = true;
		$("#e_result").show();
		$("#e_result").val("인증 실패");
		$("#randomchk").focus();
		$("#submit").hide();
	} else {
		compare_res = true;
		$("#e_result").show();
		$("#e_result").val("인증 성공");
		$("#submit").show();
	}
}



// password1, password2 비교 처리
	var compare_result = false;
	$(document).ready(function() {
		// password2 입력란을 벗어나면(tab or click) 실행 - required라 한번은 거쳐야 함
		$('#password2').focusout(pwChk);
	});
	function pwChk() {
		var pw = document.getElementsByName("member_pw")[0];
		var pwchk = document.getElementsByName("member_pw_chk")[0];
		if (pw.value == "" || pwchk.value == "" || pw.value != pwchk.value) {
			// 에러메시지 출력
			compare_result = false;
			$("#s_result").show();
			$("#s_result").text("입력된 비밀번호가 일치하지 않습니다.");
			// password1, password2 리셋
			$('#password1').val('');
			$('#password2').val('');
			// password1 입력으로 돌아가기
			pw.select();
		} else {
			compare_result = true;
			$("#s_result").show();
			$("#s_result").text("비밀번호가 일치합니다.");
		}
	}
	
	function reset_res() {
		$("#e_result").val("");
		$("#s_result").text("");
	}

//핸드폰 번호 지정 
function inputPhoneNumber(obj) {
  var number = obj.value.replace(/[^0-9]/g, "");
  var phone = "";

  if (number.length < 4) {
      return number;
  } else if (number.length < 7) {
      phone += number.substr(0, 3);
      phone += "-";
      phone += number.substr(3);
  } else if (number.length < 11) {
      phone += number.substr(0, 3);
      phone += "-";
      phone += number.substr(3, 3);
      phone += "-";
      phone += number.substr(6);
  } else {
      phone += number.substr(0, 3);
      phone += "-";
      phone += number.substr(3, 4);
      phone += "-";
      phone += number.substr(7);
  }
  obj.value = phone;
}