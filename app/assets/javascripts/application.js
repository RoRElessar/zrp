// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-datepicker
//= require bootstrap-datepicker/core

var ready;
ready = function() {
    $('#employees_search input').keyup(function() {
        $.get($('#employees_search').attr('action'),
        $('#employees_search').serialize(), null, 'script');
        false;
    });

    $('.datepicker').datepicker({
        format: "dd.mm.yyyy"
    });

    $('.flash-messages').fadeOut(4000);

    $('.errors').fadeOut(6000);
};
$(document).ready(ready);
$(document).on('page:load', ready);

