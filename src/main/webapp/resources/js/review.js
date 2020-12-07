$(function() {
	$(".starList").each(function() {
		$(this).parent()
			   .children($('.starR1'))
			   .slice(0, $(this).val())
			   .addClass('on');
		
		$(this).parent()
			   .children($('.starR2'))
			   .slice(0, $(this).val())
			   .addClass('on');
	})
});


