/*************************************************
      Menu Overlay JS 
      @author Fabio Mangolini
      http://www.responsivewebmobile.com
**************************************************/
(function($) {
	$.MenuOverlay = function(options) {
		var settings = $.extend({
            // These are the defaults.
            vertical: 'center', //accepted values=> top, center, bottom
            horizontal: 'center' //accepted values=> left, center, right
        }, options );

		//initialize the positions
		$(".menu-overlay").css({'opacity': 0, 'position': 'absolute'});
		$(".menu-overlay-container").css({'position': 'relative'});

		$(".menu-overlay-container").hover(function () {
			//get the dimension of the item to put the overlay over
			$(this).width($('.to-hover', this).outerWidth());
			$(this).height($('.to-hover', this).outerHeight());

			//menu overlay container dimensions
			var wmoc = $(this).outerWidth();
			var hmoc = $(this).outerHeight();

			//menu overlay dimensions
			var wmo = $('.menu-overlay', this).outerWidth();
			var hmo = $('.menu-overlay', this).outerHeight();

			//position the menu overlay in the middle of the menu overlay container
			var top = null;
			var left = null;
			if(settings.vertical == 'top')
				top = 0;
			else if(settings.vertical == 'center') 
				top = (hmoc/2) - (hmo/2);
			else if(settings.vertical == 'bottom') 
				top = hmoc - hmo;

			if(settings.horizontal == 'left')
				left = 0;
			else if(settings.horizontal == 'center') 
				left = (wmoc/2) - (wmo/2);
			else if(settings.horizontal == 'right') 
				left = wmoc - wmo - 1;

			$('.menu-overlay', this).css({top: top, left: left});


			//shows the overlay
			$('.menu-overlay', this).stop().animate({
				opacity: 1

			}, "fast");
		},
		function () {
			//hide the overlay
			$('.menu-overlay', this).stop().animate({
				opacity: 0

			}, "fast");
		});
	};
})(jQuery);