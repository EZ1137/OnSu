


//아이디 중복체크 
function idchk(){
	 var memberid = $("#member_id").val().trim();
	 
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
	var member_email = $("#member_email").val().trim();
	console.log(member_email);
	
	if(member_email == null || member_email == ""){
		alert("이메일을 입력해주세요");
	}else{
		$.ajax({
			url: "emailchk.do",
			type:"post",
			data:{
				"member_email":member_email				
			},
			success: function(data){
				console.log(data);
				if(data == 1){
					alert("중복된 이메일 입니다.");
				}else{
					alert("새로운 이메일");
				}
			},
			error: function(data){
				console.log(data);
				alert("데이터실패");
			}
		});
	}
	
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

