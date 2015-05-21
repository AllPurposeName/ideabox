class IdeasController < ApplicationController
  respond_to :json, :html
  def index
    @ideas = Idea.all
    respond_to do |format|
      format.html {@idea = Idea.new; render :index}
      format.json {render json: {message: 'Your item was created', idea: @ideas}}
    end
  end

  def show
    @idea = Idea.find(params[:id].to_i)
    respond_with @idea
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      respond_to do |format|
        format.html {redirect_to ideas_path}
        format.json {render json: {message: 'Your item was created', idea: @idea}}
      end
    else
      respond_to do |format|
        format.html {render :new}
        format.json {render json: {errors: @idea.errors}, status: 422}
      end
    end
  end

  def update
    respond_with Idea.update(params[:id], idea_params)

  end

  def destroy
    respond_with Idea.destroy(params[:id])
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end
