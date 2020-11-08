<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script> 	
var reply_boardno = '${freeboardDto.free_no}'; //게시글 번호
 
$('[name=replyInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=replyInsertForm]').serialize(); //replyInsertForm의 내용을 가져옴
    replyInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function replyList(){
    $.ajax({
        url : 'replylist.do',
        type : 'get',
        data : {'reply_boardno':reply_boardno},
        success : function(data){
            var a =''; 
            $.each(data, function(key, reply){ //체크............................
            	a+='<div class="replybox">';
                a += '<div class="replyArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="replyInfo'+reply.reply_no+'">'+'댓글번호 : '+reply.reply_no+' / 작성자 : '+reply.reply_id;
                a += '<a onclick="replyUpdate('+reply.reply_no+',\''+reply.reply_title +'\');"> 수정 </a>';
                a += '<a onclick="replyDelete('+reply.reply_no+');"> 삭제 </a> </div>';
                a += '<div class="replyContent'+reply.reply_no+'"> <p> 내용 : '+reply.reply_title +'</p>';
                a += '</div></div>';
                a +='</div>';
            });
            
            $(".replyList").html(a);
        }
    });
}
 
//댓글 등록
function replyInsert(insertData){
	
    $.ajax({
        url : 'replyinsert.do',
        type : 'post',
        data : insertData,
        success : function(data){
        	
            if(data == 1) {
                replyList(); //댓글 작성 후 댓글 목록 reload
                $('[name=reply_title]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function replyUpdate(reply_no, reply_title){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="reply_title_'+reply_no+'" value="'+reply_title+'"/>';//체크!!
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyUpdateProc('+reply_no+');">수정</button> </span>';
    a += '</div>';
    
    $('.replyContent'+reply_no).html(a);
    
}
 
//댓글 수정
function replyUpdateProc(reply_no){
    var updateContent = $('[name=reply_title_'+reply_no+']').val();//체크!!
    
    $.ajax({
        url : 'replyupdate.do',
        type : 'post',
        data : {'reply_title' : updateContent, 'reply_no' : reply_no},
        success : function(data){
            if(data == 1) replyList(reply_boardno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function replyDelete(reply_no){
    $.ajax({
        url : 'replydelete.do',
        type : 'post',
        data : {'reply_no' : reply_no},
        success : function(data){
            if(data == 1) replyList(reply_boardno); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    replyList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
</script>