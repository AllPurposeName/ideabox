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

  it('increases quality with a thumbs up', function(){
  assert.strictEqual($('.ideas').first().find('h2').text(), 'Powder Monkey\'s Hooch', 'It has the correct changed status.')
    var ideaId = 1
    improveIdea(ideaId)
    this.requests[0].respond(200, { "Content-Type": "application/json" });
  assert.strictEqual($('.ideas').first().find('h2').text(), 'Old Salt\'s Cordial!', 'It has the correct initial status.')
  });

  it('decreases quality with a thumbs down', function(){
  assert.strictEqual($('.ideas').first().find('h2').text(), 'Powder Monkey\'s Hooch', 'It has the correct changed status.')
    var ideaId = 1
    diminishIdea(ideaId)
    this.requests[0].respond(200, { "Content-Type": "application/json" });
  assert.strictEqual($('.ideas').first().find('h2').text(), 'Scallywag\'s Swill!', 'It has the correct initial status.')
  });
});
