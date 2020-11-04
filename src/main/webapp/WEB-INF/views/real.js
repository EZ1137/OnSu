var connection = new RTCMultiConnection();

//this line is VERY_important
connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

//if you want audio+video conferencing
connection.session = {
		audio: true,
		video: true
};

connection.sdpConstraints.mandatory = {
		OfferToReceiveAudio: true,
		OfferToReceiveVideo: true	
};

var predefinedRoomId = document.getElementById('roomid');
/*
 * document.getElementById("btn-open-or-join-room").onclick = function() {
 * this.disabled = true;
 * 
 * connection.openOrJoin(predefinedRoomId); };
 */

var localvideo = document.getElementById('localvideo');
var remotevideo = document.getElementById('remotevideo');

connection.onstream = function(event) {
	var video = event.mediaElement;
	if (event.type == 'local') {
		var div = document.createElement('div');
		localvideo.appendChild(div);
		div.appendChild(video);
	}
	if (event.type == 'remote') {
		var div = document.createElement('div');
		remotevideo.appendChild(div);
		div.appendChild(video);
	}
};
document.getElementById("btn-open").onclick = function() {
	this.disabled = true;
	
	connection.open(predefinedRoomId.value, function(isRoomCreated, roomid, error){
		if (error) {
			alert("에러가 발생했습니다.\n사유: " + error);
			document.getElementById("btn-open").disabled = false;
			return;
			}
		console.log(predefinedRoomId.value);
		});
		
};
document.getElementById("btn-join").onclick = function() {
	this.disabled = true;
	
	connection.join(predefinedRoomId.value, function(isRoomJoined, roomid, error){
		if (error) {
			alert("에러가 발생했습니다.\n사유: " + error);
			document.getElementById("btn-join").disabled = false;
			return;
			}
		console.log(predefinedRoomId.value);
		});
		
};

