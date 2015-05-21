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
//= require_tree .



$(document).ready(function (){

  var $ideas = $('.ideas');  // grabbing Ideas div. needs to be inside here so page loads
  var $updateButton = $('.update-idea-button');

  var ideaRepository = {
    all: function () {
        return $.getJSON("/ideas");
      },

    find: function (id) {
            return $.getJSON('/ideas/' + id);
          },

    update: function (id, data){
        return $.getJSON("/ideas/" + id, { data: data, type: "PUT"});
    }
  };

  var fetchIdeas = function () {
    ideaRepository.all().then(function (ideas) { ideas.forEach(addIdea); });
  };

  var addIdea = function (idea) {
    $ideas.append(['<div class="idea" id= "" + idea.id>',
                    '<h4>', idea.title, '</h4>',
                    '<p>', idea.body, '</p>',
                    '<button class="update-idea-button">Update</button>',
                    '</div>'
                  ].join(''));
  };

  $(".update-idea-button").click(function (e){
    e.preventDefault();
    alert("who");
    // var $id = $(this).parent().attr("id")
  });

  fetchIdeas();

  $('.new-idea-button').click(function (event){
    $('.new-idea-form').toggleClass("hidden");
  });

  $(".new-idea-form").on("ajax:success", function(event, data, status, xhr){
    $(".ideas").append(['<div class="idea">',
                    '<h4>', data.title, '</h4>',
                    '<p>', data.body, '</p>',
                    '<button class="update-idea-button">Update</button>',
                    '</div>'
                  ].join(''));
  });



});


// create: function (data) {
//           return $.post('/ideas/', data);
//         },
// update: function (id, data) {
//           return $.ajax('/ideas/' + id, { data: data, type: 'PUT' });
//         },
// destroy: function (id) {
//            return $.ajax('/ideas/' + id, { type: 'DELETE' });
//          }
