<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>

   	<c:forEach items="${callist }" var="calendardto">
   		<input type="hidden" name="time" value="${calendardto.calendar_mdate }">
   		<input type="hidden" name="title" value="${calendardto.calendar_title }">
	</c:forEach>

<script type="text/javascript">

window.onload = function(){
	if(window.Notification){
		Notification.requestPermission(); //윈도우 온로드 될 때 웹 푸시알림 허가할건지 물어봄 
    }
}

$(function () {
	// 브라우저가 알림을 지원하는지 확인
	if(!("Notification" in window)) {
		alert("this browser does not support desktop notification");
	}
	// 알림 권한이 있는지 확인
	else if(Notification.permission === "granted") {
		// 권한이 있다면 새로운 알림 생성
		var all = document.getElementsByName("time")[0].value;
		var year = all.substring(0, 4);
		var month = all.substring(4, 6);
		var date = all.substring(6, 8);
		var hour = all.substring(8, 10);
		var min = all.substring(10, 12);
		var time = year + '-' + month + '-' + date + 'T' + hour + ":" + min + ":00";
		var ktime = new Date(time);
		var now = new Date();
		var title = document.getElementsByName("title")[0].value;
		var dif = Math.floor((ktime.getTime() - now.getTime()) / (60 * 1000));
		var h = Math.floor(dif/60);
		var m = Math.floor(dif - h*60);
		if(m == 59) {
				var notification = new Notification("강의!", {body : title + "까지" + (h+1) + "시간 남았습니다."});
		} else if((h >= 1) && (m >= 59)) {
			var notification = new Notification("강의!", {body : title + "까지" + h + "시간" + m + "분 남았습니다."});
		} else if((h >= 1) && (m < 59)) {
			var notification = new Notification("강의!", {body : title + "까지" + h + "시간" + (m+1) + "분 남았습니다."});
		} else {
			var notification = new Notification("강의!", {body : title + "까지" + (m+1) + "분 남았습니다."});
		}
	}
	// 권한이 없다면 권한을 요청
	else if(Notification.permission !== "denied") {
		Notification.requestPermission().then(function (permission) {
			// 사용자가 수락하면 알림 생성
			if(permission === "granted") {
				var notification = new Notification("Hi there!");
			}
		});
	}
});
	
</script>

</body>
</html>