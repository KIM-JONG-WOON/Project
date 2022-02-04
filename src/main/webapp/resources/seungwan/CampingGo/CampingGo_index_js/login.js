$(document).ready(function(){
	$('.total-login').on('click', function(){
		$('.header_t').toggleClass('active');
	});
	
	$('body').on('click', function(e){
		var $tgPoint = $(e.target);
		var $popCallBtn = $tgPoint.hasClass('total-login');
		var $popArea = $tgPoint.hasClass('header_t');

		if(!$popCallBtn && !$popArea){
			$('.header_t').removeClass('active');
		}
	});
});
