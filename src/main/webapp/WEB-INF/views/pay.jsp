<%@page import="com.kh.onsoo.pay.model.dto.PayDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>

<input type="hidden" name="member_id" value="${member_id }" />
<input type="hidden" name="listen_classno" value="${listen_classno}" />
<input type="hidden" name="title" value="${dto.getClassDto().getClass_title() }" />
<input type="hidden" name="price" value="${dto.getClassDto().getClass_price() }" />
<input type="hidden" name="email" value="${dto.getAdminDto().getMember_email() }" />
<input type="hidden" name="name" value="${dto.getAdminDto().getMember_name() }" />
<input type="hidden" name="addr" value="${dto.getAdminDto().getMember_addr() }" />

<script type="text/javascript">
$(function(){
var IMP = window.IMP;		
IMP.init("imp62815719");	

IMP.request_pay({
	
	pg: "html5_inicis",	
	pay_method: "card",	
	merchant_uid: "merchant-"+new Date().getTime(),	
	name: document.getElementsByName("title")[0].value,	
	amount: document.getElementsByName("price")[0].value,
	buyer_email: document.getElementsByName("email")[0].value,	
	buyer_name: document.getElementsByName("name")[0].value,		
	buyer_addr: document.getElementsByName("addr")[0].value,	

}, function (rsp) { // callback
  if (rsp.success) {	// 결제가 성공적으로 처리되면
	// jQuery로 HTTP 요청
	alert("결제가 완료되었습니다.");
	
	window.location.href="listenInsert.do?member_id=" + document.getElementsByName("member_id")[0].value
			+ "&listen_classno=" + document.getElementsByName("listen_classno")[0].value
			+ "&title=" + document.getElementsByName("title")[0].value;	// 해당 페이지로 이동
	
    } else { 			// 결제 취소, 결제 실패 시
      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
    
      window.location.href="main.do";	// 해당 페이지로 이동
    }
  });
});	

</script>

</body>
</html>