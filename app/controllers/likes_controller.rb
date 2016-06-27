class LikesController < ApplicationController


  def create
    like = Like.new
    like.idea = idea
    like.user = current_user
    if like.save
      redirect_to idea_path, notice: "Thanks for liking"
    else
      redirect_to ideas_path, alert: "Failed to Like"
    end
  end

  def destroy
    like = Like.find params[:id]
    idea = Idea.find params[:idea_id]
    like.destroy
    redirect_to idea_path(idea), notice: "Un-liked"
  end

  private

  def like
    @like ||= Like.find params[:id]
  end

  def idea
    @idea ||= Idea.find params[:idea_id]
  end

end
