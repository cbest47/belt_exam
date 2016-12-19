class LikesController < ApplicationController
  def create
    idea = Idea.find(params[:idea][:id])
    user = User.find(session[:user_id])
    like = Like.create(user:user, idea:idea)
    
    redirect_to :back
  end
end
