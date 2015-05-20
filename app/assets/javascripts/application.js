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
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function (){

  // fetchIdeas();
  //
  // function fetchIdeas() {
  //
  // }

  // function renderIdea(data, id) {
  //   return $("<div class='ideas' data-id ='" + id +  "'>" +
  //       '<h3>' + data.title + '</h3>'
  //   '</div>');
  // }

  $('.new-idea-button').click(function (event){
    $('.new-idea-form').toggleClass("hidden");
  });

  $(".new-idea-form").on("ajax:success", function(event, data, status, xhr){
    $(".ideas").append("<li> Title: " + data.title + " " + "Description: " + data.body + "</li>")
    // $(".ideas").append("<li> Description: " + data.body + "</li>")
  });



});
