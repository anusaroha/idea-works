class JoinsController < ApplicationController

  def create
    join = Join.new(idea: idea, user: current_user)
    join.idea = idea
    join.user = current_user
    if join.save && (join.user != current_user)
      redirect_to ideas_path(idea), notice: "Thanks for Joining"
    else
      redirect_to ideas_path(idea), alert: "Failed to Join"
    end
  end

  def destroy
    join = Join.find params[:id]
    idea = Idea.find params[:idea_id]
    join.destroy
    redirect_to ideas_path(join), notice: "Left"
  end

  private

  def join
    @join ||= Join.find params[:id]
  end

  def idea
    @idea ||= Idea.find params[:idea_id]
  end
end
