$( document  ).ready(function() {

});

var $ideas = $('.ideas');
var $deleteIdea = $('#delete-idea');

var IdeaRepository = {
  all: function () {
         return $.getJSON('/ideas');
       },
  find: function (id) {
          return $.getJSON('/ideas/' + id);
        },
  create: function (data) {
            return $.post('/ideas/', data);
          },
  update: function (id, data) {
            return $.ajax('/ideas/' + id, { data: data, type: 'PUT' });
          },
  destroy: function (id) {
             return $.ajax('/ideas/' + id, { type: 'DELETE' });
           }
};

var improveIdea = function (ideaId) {
  change = ((IdeaRepository.find(ideaId).then(function (data){
    return data.quality) + 1)
  });
  var quality = {idea: { quality: change }}
  IdeaRepository.update(ideaId, quality).then(function (){
    var classToRemove = ".idea-" + ideaId;
    $(".ideas").remove(classToRemove);
  });
  IdeaRepository.find(ideaId).then(function (idea){
    $(".ideas").prepend(['<div class="ideas">',
      '<h3>', idea.title, '</h3>',
      '<p>', idea.body, '</p>',
      '</div>'].join(''));

    data);
  });
};

var diminishIdea = function (ideaId) {
  change = ((IdeaRepository.find(ideaId).then(function (data){
    return data.quality) - 1)
  });
  var quality = {idea: { quality: change }}
  IdeaRepository.update(ideaId, quality).then(function (){
    var classToRemove = ".idea-" + ideaId;
    $(".ideas").remove(classToRemove);
  });
  IdeaRepository.find(ideaId).then(function (data){
    $(".ideas").prepend(data);
  });
};

var improveIdeaOnSubmission = function () {
  var id = this.attr("data-improveIdea");
  $submitImprove.on('click', improveIdea(id))
};

var diminishIdeaOnSubmission = function () {
  var id = this.attr("data-diminishIdea")
    $submitDiminish.on('click', diminishIdea(id));
};

var init = function () {
  improveIdea();
  diminishIdea();
  improveIdeaOnSubmission();
  diminishIdeaOnSubmission();
};
