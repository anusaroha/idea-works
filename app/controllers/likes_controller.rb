class LikesController < ApplicationController


  def create
    like = Like.new(idea: idea, user: current_user)
    like.idea = idea
    like.user = current_user
    if like.save && (idea.user != current_user)
      redirect_to ideas_path(idea), notice: "Thanks for liking"
    else
      redirect_to ideas_path(idea), alert: "Failed to Like"
    end
  end

  def destroy
    like = Like.find params[:id]
    idea = Idea.find params[:idea_id]
    like.destroy
    redirect_to ideas_path(idea), notice: "Un-liked"
  end

  private

  def like
    @like ||= Like.find params[:id]
  end

  def idea
    @idea ||= Idea.find params[:idea_id]
  end

end
