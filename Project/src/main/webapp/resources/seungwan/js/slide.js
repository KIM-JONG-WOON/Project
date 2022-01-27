$(document).ready(function() {

	/*1번슬라이드*/
	$('.tour_list').slick({   
		arrows : true,
		infinite: true,
		speed: 300,
		autoplay : true,
		autoplaySpeed : 2000,
		slidesToShow: 5,
		slidesToScroll: 1,
		responsive: [
		{
		  breakpoint: 1024,
		  settings: {
			slidesToShow: 3,
			slidesToScroll: 3,
			infinite: true,
			dots: false
		  }
		},
		{
		  breakpoint: 600,
		  settings: {
			slidesToShow: 1,
			slidesToScroll: 1
		  }
		},
		{
		  breakpoint: 480,
		  settings: {
			slidesToShow: 1,
			slidesToScroll: 1
		  }
		} 
	  ]
	}) 

});
 
$(document).ready(function() {
	/*2캠핑족을위한꿀팁 슬라이드*/
	 $('.tip_list').slick({   
		arrows : true,
		infinite: true,
		speed: 300,
		autoplay : true,
		autoplaySpeed : 2000,
		slidesToShow: 3,
		slidesToScroll: 1,
		responsive: [
		{
		  breakpoint: 1024,
		  settings: {
			slidesToShow: 3,
			slidesToScroll: 3,
			infinite: true,
			dots: false
		  }
		},
		{
		  breakpoint: 600,
		  settings: {
			slidesToShow: 1,
			slidesToScroll: 1
		  }
		},
		{
		  breakpoint: 480,
		  settings: {
			  slidesToShow: 1,
			  slidesToScroll: 1
		  }
		} 
	  ]
	});
});

$(document).ready(function() {

	 //3팝업존슬라이드
	 $('.pop_img_w').slick({   
		arrows : true,
		infinite: true,
		speed: 300,
		autoplay : true,
		autoplaySpeed : 2000,
		slidesToShow: 1,
		slidesToScroll: 1,
		 
		})
	
});

$(document).ready(function() {

	 //테마,그리고 캠핑 슬라이드
	 $('.item_w').slick({   
		arrows : true, 
	 
		infinite: true,
		speed: 300,
		autoplay : true,
		autoplaySpeed : 3500,
		slidesToShow: 3,
		slidesToScroll: 3,
		
		responsive: [
		{
		  breakpoint: 1024,
		  settings: {
			slidesToShow: 3,
			slidesToScroll: 3,
			infinite: true,
			dots: false
		  }
		},
		{
		  breakpoint: 740,
		  settings: {
			slidesToShow: 2,
			slidesToScroll: 2
		  }
		},
		 
		{
		  breakpoint: 540,
		  settings: {
			  slidesToShow: 1,
			  slidesToScroll: 1
		  }
		} 
	  ]
		 
		});
	 
	  
});


$(document).ready(function() {

	 //메인슬라이드
	 $('.m_bg_w').slick({ 
		fade: true,
		arrows : false, 
		infinite: true,
		speed: 500,
		dots: true,
		autoplay : true,
		autoplaySpeed : 5000,
		slidesToShow: 1,
		slidesToScroll: 1,
		
		 
		});

		$('.pause').on('click', function() {
			$('.m_bg_w')
				.slick('slickPause')
		});

		$('.play').on('click', function() {
			$('.m_bg_w')
				.slick('slickPlay')
		});

	 //메인슬라이드
	 $('.m_notice_banner').slick({ 
		fade: true,
		arrows : false, 
		infinite: true,
		speed: 500,
		dots: true,
		autoplay : true,
		autoplaySpeed : 5000,
		slidesToShow: 1,
		slidesToScroll: 1,
		});
	
});
