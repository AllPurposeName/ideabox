var assert = chai.assert;

describe('IdeaRepository', function () {
  beforeEach(function () {
    sinon.spy($, 'ajax');
    this.requests = [];
    this.xhr = sinon.useFakeXMLHttpRequest();
    this.xhr.onCreate = function (req) { this.requests.push(req); }.bind(this);
  });

  afterEach(function () {
    $.ajax.restore();
    this.xhr.restore();
  });

  it('#all makes an AJAX call to the server', function () {
    NoteRepository.all();
    assert($.ajax.calledOnce, 'We hit JQuery\'s AJAX method');
    assert.strictEqual(this.requests.length, 1, 'We made one AJAX request');
  });

  it('#all makes a GET request to /api/notes', function () {
    NoteRepository.all();
    var request = this.requests[0];
    assert.strictEqual(request.url, '/api/notes', 'We\'re hitting the right endpoint');
    assert.strictEqual(request.method, 'GET', 'We\'re firing the right method');
  });
});


describe('deleteIdea()', function () {
  before(function () {
    this.idea = new Idea({title: 'Delete this title', body: 'Delete this body'});
  });

  it('removes the element from the DOM', function () {
    deleteIdea(idea)

    this.server.requests[0].respond(200, { "Content-Type": "application/json" }, notes);

    assert.strictEqual($('.note').length, 3, 'It should append our three notes to the DOM');
    assert.strictEqual($('.note').first().find('h3').text(), 'Hello World', 'It has our note text.')
  });
});
