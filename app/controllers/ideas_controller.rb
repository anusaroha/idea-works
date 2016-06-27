class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def new
  end

  def edit
    redirect_to root_path, alert: "access defined" unless can? :edit, @idea
  end

  def index
    @ideas = Idea.all
    @ideas = Idea.order(created_at: :desc)
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      flash[:notice] = "Idea Created!"
      redirect_to idea_path(@idea)
    else
      flash[:alert] = "Idea not created"
      render :new
    end
  end

  def update
    if @idea.update idea_params
      redirect_to root_path, alert: "access defined" unless can? :update, @idea
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, notice: "Idea Deleted"
    redirect_to root_path, alert: "Acess Denied" unless can? :destroy, @idea
  end


  def show
    @idea = Idea.find params[:id]
  end

  private
    def idea_params
      params.require(:idea).permit(:title, :text)
    end

    def find_idea
      @idea = Idea.find params[:id]
    end


    def authorize_user
      unless can? :manage, @idea
      redirect_to root_path , flash: { info: "Access Denied" }
      end
    end

end
