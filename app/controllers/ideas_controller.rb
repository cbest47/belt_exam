class IdeasController < ApplicationController
  def index
  end

  def show
    @idea = Idea.find(params[:id])
    @like = Like.all.where("idea_id" => params[:id]).select(:user_id).distinct
  end

  def create
    idea = Idea.new(content: idea_params['content'], user: current_user)
    flash["success"] = "Idea was created" if idea.save
    redirect_to users_path
  end

  def destroy
    idea = Idea.find(params[:id])
    Idea.destroy if idea.user == current_user
    redirect_to users_path
  end

  private

  def idea_params
    params.require(:idea).permit(:content)
  end

end
