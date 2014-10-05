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
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require turbolinks
//= require_tree .

$(document).ready(readyFunc);
$(document).on('page:load', readyFunc);

function readyFunc(){
  $('body').on('click', 'li.house-pin-toggle-show a', function(e){
    e.preventDefault();
    $(this).parent().removeClass('house-pin-toggle-show');
    $(this).parent().addClass('house-pin-toggle-hide');
    $(this).text('Hide Pin');
    $('.house-pin').addClass('house-pin-show');
  });
  $('body').on('click', 'li.house-pin-toggle-hide a', function(e){
    e.preventDefault();
    $(this).parent().removeClass('house-pin-toggle-hide');
    $(this).parent().addClass('house-pin-toggle-show');
    $(this).text('Show Pin');
    $('.house-pin').removeClass('house-pin-show');
  });
  $('body').on('click', '.show-sign-in-form', function(e){
    e.preventDefault();
    $('#user_signup_form').hide();
    $('#user_signin_form').show();
  });
  $('body').on('click', '.show-sign-up-form', function(e){
    e.preventDefault();
    $('#user_signup_form').show();
    $('#user_signin_form').hide();
  });
}
