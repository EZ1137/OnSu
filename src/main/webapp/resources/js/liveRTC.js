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
        
        var roomid = document.getElementById('broadcast_title'); // 입력한 ID 변수에 담기
        var userId = document.getElementById('member_nickname');
        
        var roomcontent = document.getElementById("broadcast_content");
        var roomcategory = document.getElementById("broadcast_category");

        /********************************방 생성********************************/