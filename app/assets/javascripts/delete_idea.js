var $ideas = $('.ideas');
var $deleteIdea = $('#delete-idea');

var IdeaRepository = {
  all: function () {
         return $.getJSON('/ideas');
       },
  find: function (id) {
          return $.getJSON('/ideas' + id);
        },
  create: function (data) {
            return $.post('/ideas', data);
          },
  update: function (id, data) {
            return $.ajax('/ideas' + id, { data: data, type: 'PUT' });
          },
  destroy: function (id) {
             return $.ajax('/ideas' + id, { type: 'DELETE' });
           }
};

var deleteIdea = function (note) {
  IdeaRepository.delete(note)
};

var deleteIdeaOnSubmission = function () {
  $submitDelete.on('click', deleteIdea);
};

var init = function () {
  deleteIdea();
  deleteIdeaOnSubmission();
};
