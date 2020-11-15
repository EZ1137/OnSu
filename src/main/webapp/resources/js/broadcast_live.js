
var button = document.getElementById('btn-open-or-join-room');
var live_no = document.getElementById("live_no");
var content_res = document.getElementById('content_res');


button.addEventListener("click", function(){
	console.log("버튼 클릭");
var live_no = document.getElementById("live_no").value;
	live_no.innerHTML = live_no;

})
