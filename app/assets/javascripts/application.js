// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

$(document).ready(function() {

  var openModalOnLink = function(link, modal) {
    $('body').on('click', link, function(){
      $(modal).modal('show');
    });
  }

  openModalOnLink('.signup-popup-link', '#signup-modal');
  openModalOnLink('.signin-popup-link', '#signin-modal');
  openModalOnLink('#new_form', '#meal-modal');
  openModalOnLink('.edit-meal', '#meal-modal');

});

$(document).ready(function() {
	console.log('Loading...')
	$('.date-picker').datetimepicker({
		pickTime: false
	});
	
	$('.time-picker').datetimepicker({
		pickDate: false,
		useSeconds: false
	});
});