(function($){
  $(function(){

    $('.button-collapse').sideNav();
    $('#dropdown_dep').material_select();
    $('#dropdown_ciudad').material_select();
    $('#dropdown_puesto').material_select();
    $('#puest').material_select();
	$('#menu').load('navbar.jsp');
	$('.slider').slider({full_width: true})
  });
})(jQuery);