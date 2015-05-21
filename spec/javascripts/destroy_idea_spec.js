var assert = chai.assert;

describe('IdeaRepository', function () {
  beforeEach(function () {
    MagicLamp.load("ideas/index");
    sinon.spy($, 'ajax');
    this.requests = [];
    this.xhr = sinon.useFakeXMLHttpRequest();
    this.xhr.onCreate = function (req) { this.requests.push(req); }.bind(this);
  });

  afterEach(function () {
    MagicLamp.clean();
    $.ajax.restore();
    this.xhr.restore();
  });

  it('#all makes an AJAX call to the server', function () {
    IdeaRepository.all();
    assert($.ajax.calledOnce, 'We hit JQuery\'s AJAX method');
    assert.strictEqual(this.requests.length, 1, 'We made one AJAX request');
  });

  it('#all makes a GET request to /ideas', function () {
    IdeaRepository.all();
    var request = this.requests[0];
    assert.strictEqual(request.url, '/ideas', 'We\'re hitting the right endpoint');
    assert.strictEqual(request.method, 'GET', 'We\'re firing the right method');
  });

  it('removes the element from the DOM', function () {
    assert.strictEqual($('.ideas').length, 15, 'It should begin with seeded items in the DOM');
    var ideaId = 1
    deleteIdea(ideaId)
    this.requests[0].respond(200, { "Content-Type": "application/json" });
  assert.strictEqual($('.ideas').length, 14, 'It should remove an element from the DOM');
  assert.strictEqual($('.ideas').first().find('h3').text(), 'Hello World', 'It has our note text.')
  });
});
