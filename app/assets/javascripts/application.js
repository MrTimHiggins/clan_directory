// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery.min
//= require bootstrap.bundle.min

// Remove bootstrap flash messages
setTimeout(function() {
  $('.alert').slideUp();
}, 2000);

// Keep-alive for app so it doesn't go to sleep (default sleep is after 1 hour)
setInterval(function() {
  $.ajax({
    type: 'GET',
    url: "http://clanhiggins.com"
  });
}, 1200000); // every 20 minutes (1200000)
