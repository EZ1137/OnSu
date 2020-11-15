
        //RTCMultiConnection Default Settings
        var connection = new RTCMultiConnection();

        connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

        connection.session = {
            audio: true,
            video: true,
            data: true
        };


        connection.sdpConstraints.mandatory = {
            OfferToReceiveAudio: true,
            OfferToReceiveVideo: true
        };

        connection.onmessage = appendDIV;

        var localVideosContainer = document.getElementById('local-videos-container');
        var remoteVideosContainer = document.getElementById('remote-videos-container');
        
        var roomid = document.getElementById('live_no'); // 입력한 ID 변수에 담기
        var userId = document.getElementById('live_id');
        


        /********************************방 생성********************************/
        
        /* value.trim() -> 공백으로 값을 채워지지 않게 각 변수에 공백 제거 설정 */
        if(live_no.value != null && live_id.value != null){
            
        document.getElementById('btn-open-or-join-room').onclick = function () {
            this.disabled = true;
            console.log(live_no.value);
            connection.live_id= live_id.value;
            console.log(live_id.value);
            connection.checkPresence(roomid.value, (isRoomExist) => {

                if (isRoomExist === true) {
                    connection.join(roomid);
                    connection.onstream = (e) => {
                        sectionStyle();
                        let video = e.mediaElement;
                        connection.attachStreams.forEach((localStream) => {
                            localStream.stop();
                        });
                        remoteVideosContainer.appendChild(video);
                    }
                } else {
                    let live_id = $("#live_id").val();
                    let member_nickname = $('#member_nickname').val();
                    let live_no = $("#live_no").val();
                   
                    console.log(live_id, live_no);

                    $.ajax({
                       type : "POST",
                       url : "liveinsert.do",
                       data : { live_id,						
								live_no
								},
                       success : () => {
                          console.log("전송성공");
                          sectionStyle();
                       },
                       error : () => {
                          console.log("전송실패");
                       }
                    }).done(() => {
						connection.open(roomid.value);
                    	connection.onstream = (event) => {
                        let video = event.mediaElement;
                        localVideosContainer.appendChild(video);
                    	}
					})
					}
			});
			}
		}

        function sectionStyle() {
           let section1 = document.getElementById("section1");
           section1.style.display = "none";

           let section2 = document.getElementById("section2");
           section2.style.display = "flex";
            }
        
        // 채팅전송
        let inputText = document.getElementById('input-text-chat').onkeyup = function (e) {
	
            if (e.keyCode != 13) return;

            this.value = this.value.replace(/^\s+|\s+$/g, '');

            if (!this.value.length) return;

            console.log(this.value);

            connection.send(this.value);

            appendDIV(this.value);
            this.value = '';
            // 값이 있으면 return 
        };

        // 채팅 입력 태그
        let chatContainer = document.querySelector('#chat-output');

        // 채팅 내용 담기는 부분
        function appendDIV(e) {
            let div = document.createElement('div');
            if (e.userid == null) { // 보내는 사람이 undefined면.. 즉, 내가 보냈다면
                div.innerHTML = (connection.userid) + ': ' + (e.data || e);
            } else {
                div.innerHTML = (e.userid) + ':' + (e.data || e);
            }
            console.log(e.userid + ' <-상대방 || 나->' + connection.userid);
            chatContainer.appendChild(div);
            div.tabIndex = 0;
            div.focus();

            document.getElementById('input-text-chat').focus();
        }

        let disconnectRoom = document.getElementById("disconnect-room");

        disconnectRoom.onclick = function() {
		
			let live_id = document.getElementById('live_id');
           
            if (connection.isInitiator) {
                connection.close();
            	alert("방송을 종료 하였습니다.");
            	this.disabled = true;
            	location.href='close.do?live_id=' + live_id.value;
            }
        }
 