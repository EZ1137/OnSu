<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On:Soo - CONTACT</title>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b5875b6357c295684ace96bf43b36b75"></script>


<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>


<link
	href="${pageContext.request.contextPath}/resources/css/contact.css?after"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">

</head>


<body>

	<!-- header -->
	<header id="header">
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>

	<section class="section area">
		<div class="contact_board_title">
			<p>CONTACT</p>
		</div>

		<div class="contact_box">

			<div class="contact_inner_first">
				<div class="inner_area01">
					<div class="inner_area01_title">상담 운영 시간</div>
					<i class="fas fa-headset-3x"></i>
					<div>평일 오전 10시~ 오후 5시</div>
					
				</div>
				<div class="inner_area02">1: 1 문의하기</div>
				
				<div class="inner_area03">
					전화 / EMAIL 문의하기
					<div class="area03_text">
						<p>02-0000-0000</p>
					<p>help@kh.com</p>
					</div>
					
				</div>
			</div>
			<div class="contact_inner_second">
				<div class="inner_area04">찾아오는 길</div>
				<div id="map"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkeyb5875b6357c295684ace96bf43b36b75"></script>
				<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>


				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(37.49897618872199, 127.03282946839434), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
				

					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					var mapTypeControl = new kakao.maps.MapTypeControl();

					// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					map.addControl(mapTypeControl,
							kakao.maps.ControlPosition.LEFT);

					// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new kakao.maps.ZoomControl();
					map.addControl(zoomControl,
							kakao.maps.ControlPosition.LEFT);
					// 마커를 표시할 위치입니다 
					var position =  new kakao.maps.LatLng(37.49897618872199, 127.03282946839434);

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					  position: position
					});

					// 마커를 지도에 표시합니다.
					marker.setMap(map);

					// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
					var iwContent = '<div style="padding:5px;"> 온수 본사 </div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    content : iwContent
					});

					// 마커에 마우스오버 이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'mouseover', function() {
					  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
					    infowindow.open(map, marker);
					});

					// 마커에 마우스아웃 이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'mouseout', function() {
					    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
					    infowindow.close();
					});

				    
				</script>
			</div>
		</div>
	</section>

	<!-- footer -->
	<footer id="footerarea" class="area">
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</footer>

</body>
</html>