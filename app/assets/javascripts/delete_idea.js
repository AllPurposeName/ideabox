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

var deleteIdea = function (ideaId) {
  IdeaRepository.destroy(ideaId).then(function (){
    /**
     this.attr("data-itemId").remove();
     */
  });

};

var deleteIdeaOnSubmission = function () {
  var id = this.attr("data-itemId")
  $submitDelete.on('click', deleteIdea(id));
};

var init = function () {
  deleteIdea();
  deleteIdeaOnSubmission();
};
