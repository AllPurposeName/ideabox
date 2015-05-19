class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
    @idea = Idea.new
  end

  def create
    Idea.create(idea_params)
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end
