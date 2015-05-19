class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
    @idea = Idea.new
  end
end
