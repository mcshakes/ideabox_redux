class IdeasController < ApplicationController

  def index
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(idea_params)
    # binding.pry
    render json: @idea
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end


end
