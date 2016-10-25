class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new
    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    @topic.public = params[:topic][:public]

    if @topic.save
      flash[:notice] = "Topic successfully created."
      redirect_to(@topic)
    else
      flash[:alert] = "Error creating topic. Please attempt once more."
      render(:new)
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    @topic.public = params[:topic][:public]

    if @topic.save
      flash[:notice] = "Topic successfully updated."
      redirect_to(@topic)
    else
      flash[:alert] = "Error udating topic. Please attempt once more."
      render(:edit)
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Topic successfully deleted."
      redirect_to(:topics)
    else
      flash[:alert] = "Error deleting topic. Please attempt once more."
      render(:show)
    end    
  end
end
