MagicLamp.fixture(controller: IdeasController) do
  @ideas = Idea.all
  @idea = Idea.new
  render template: "ideas/index"
end
