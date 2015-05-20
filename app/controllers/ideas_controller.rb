class IdeasController < ApplicationController
  respond_to :json, :html

  def index
    # @idea = Idea.new
    respond_with Idea.all

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
