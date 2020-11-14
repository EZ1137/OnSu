<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>

var review_classno = ${studyDto.class_no};
var member_id = "${member_id}";


$('[name=reviewInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=reviewInsertForm]').serialize(); //replyInsertForm의 내용을 가져옴
    reviewInsert(insertData); //Insert 함수호출(아래)
});

function review(){
    $.ajax({
        url : '/onsoo/review.do',
        type : 'get',
        data : {'review_classno':review_classno},
        success : function(data){
        	
            var a =''; 
            $.each(data, function(key, review){
            	a += '<div class="reviewbox">';
                a += '<div class="reviewArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="reviewInfo'+review.review_no+'">'+'작성자 : '+review.review_id+'  작성일 : '+review.review_date+'수정일 : '+review.review_update;
                a += '<a onclick="reviewUpdate('+review.review_no+',\''+review.review_content +'\');"> 수정 </a>';
                a += '<a onclick="reviewDelete('+review.review_no+');"> 삭제 </a> </div>';
                a += '<div class="starRev">';
	  			a += '<span class="starR1" id="s1"><input type="hidden" value="1"/></span>';
  				a += '<span class="starR2" id="s2"><input type="hidden" value="2"/></span>';
  				a += '<span class="starR1" id="s3"><input type="hidden" value="3"/></span>';
		  		a += '<span class="starR2" id="s4"><input type="hidden" value="4"/></span>';
		 		a += '<span class="starR1" id="s5"><input type="hidden" value="5"/></span>';			 				
		 		a += '<span class="starR2" id="s6"><input type="hidden" value="6"/></span>';
  				a += '<span class="starR1" id="s7"><input type="hidden" value="7"/></span>';
  				a += '<span class="starR2" id="s8"><input type="hidden" value="8"/></span>';
		  		a += '<span class="starR1" id="s9"><input type="hidden" value="9"/></span>';
		  		a += '<span class="starR2" id="s10"><input type="hidden" value="10"/></span>';
				a += '<input type="hidden" class="starList" name="review_star" value="' + review.review_star + '"/>';
				a += '</div><br/><br/>';
                a += '<div class="reviewContent'+review.review_no+'"> <p> 내용 : '+review.review_content +'</p>';
                a += '</div></div>';
                a +='</div>';
            });
            console.log(data);
            $(".review").html(a);
        }
    });
}

function reviewInsert(insertData){
    $.ajax({
        url : '/onsoo/reviewInsert.do',
        type : 'post',
        data : insertData,
        success : function(data){
        	
            if(data == 1) {
                review(); //댓글 작성 후 댓글 목록 reload
                $('[name=review_content]').val('');
            }
        }
    });
}


function reviewUpdate(review_no, review_content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="review_content_'+review_no+'" value="'+review_contnet+'"/>';//체크!!
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="reviewUpdateProc('+review_no+');">수정</button> </span>';
    a += '</div>';
    
    $('.reviewContent'+review_no).html(a);
    
}


function reviewUpdateProc(review_no){
    var updateContent = $('[name=repviwe_title_'+review_no+']').val();//체크!!
    
    $.ajax({
        url : '/onsoo/reviewupdate.do',
        type : 'post',
        data : {'review_content' : updateContent, 'review_no' : review_no},
        success : function(data){
            if(data == 1) review(review_classno); //댓글 수정후 목록 출력 
        }
    });
}


function reviewDelete(review_no){
    $.ajax({
        url : '/onsoo/reviewdelete.do',
        type : 'post',
        data : {'review_no' : review_no},
        success : function(data){
            if(data == 1) review(review_classno); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
$(document).ready(function(){
    review(); //페이지 로딩시 댓글 목록 출력 
});


</script>







