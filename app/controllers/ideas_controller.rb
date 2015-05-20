class IdeasController < ApplicationController
  respond_to :json, :html

  def index
    @idea = Idea.new
    respond_with Idea.all

  end

  def show
    respond_with Idea.find_by(id: params[:id])
  end

  def update
    respond_with Idea.update(params[:id], idea_params)
  end

  def create
    respond_with Idea.create(idea_params)

    # @idea = Idea.create(idea_params)
    # render json: @idea
  end

  def destroy
    respond_with Idea.delete(params[:id])
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end


end
