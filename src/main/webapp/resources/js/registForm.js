


//아이디 중복체크 
function idchk(){
	 var memberid = $("#memberid").val().trim();
	 
	 console.log(memberid);
	 
	 if(memberid == null || memberid == ""){
		 alert("아이디를 입력해주세여");
	 }else{
		 $.ajax({
			 url:"idChk.do",
			 type:"post",
			 data:{
               "member_id": memberid
           },
			 success:function(data){
				 console.log(data);
				if(data == 1){
					alert("중복");
				}else{
					alert("새로운아이디");
				}
			 },
			 error: function(data){
				 console.log(data)
				 alert("데이터 실패")
			 }
		 });
	 }
	 
	}

//이메일 중복체크 
function emailchk(){
	var memberemail = $("#memberemail").val().trim();
	console.log(memberemail);
	
	if(memberemail == null || memberemail == ""){
		alert("이메일을 입력해주세요");
	}else{
		$.ajax({
			url: "emailchk.do",
			type:"post",
			data:{
				"member_email":memberemail				
			},
			success: function(data){
				console.log(data);
				if(data == 1){
					alert("중복된 이메일 입니다.");
				}else{
					alert("사용 가능한 이메일입니다.");
				}
			},
			error: function(data){
				console.log(data);
				alert("데이터실패");
			}
		});
	}
	
}


//비밀번호 유효성검사 
var compare_result= false;		
function fn_compare_pwd(){
	
	
	var pw1 = $("#password1").val();
	var pw2 = $("#password2").val();
	
	console.log(pw1)
	
	var s_result=$("#s_result");
	
	if(pw1 =="" || pw2=="" ){
		alert("비밀번호를 입력해주세요")
	}
	
	else if(pw1 == pw2){
		compare_result = true;
		$("#s_result").show();
		$("#s_result").text("비밀번호가 일치합니다.");
		$("#s_result").focus();
	}else{
		compare_result = false;
		$("#s_result").show();
		$("#s_result").text("비밀번호가 일치하지 않습니다.");
		$("#s_result").focus();
		}


//핸드폰 번호 지정 
function inputPhoneNumber(obj) {
  var number = obj.value.replace(/[^0-9]/g, "");
  var phone = "";

  if(number.length < 4) {
      return number;
  } else if(number.length < 7) {
      phone += number.substr(0, 3);
      phone += "-";
      phone += number.substr(3);
  } else if(number.length < 11) {
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
}	