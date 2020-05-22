class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_tool, only: [:show, :edit, :destroy, :update ]

  def index
    if  params.dig(:tool, :name).present?
      @tools = Tool.where("name ILIKE ?", "%#{params[:tool][:name]}%")
    else
      @tools = Tool.all
    end
    @tools = @tools.select{ |tool| tool.user.geocoded?}
    # tool.user.geocoded?
    @markers = @tools.map do |tool|
        {
          lat: tool.user.latitude,
          lng: tool.user.longitude
        }
    end
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def show
    @review = Review.new
  end

  def edit
  end

  def update
    if @tool.update(tool_params)
      redirect_to tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @tool.destroy
    redirect_to user_path(@user)
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :active, :price_per_day, :category)
  end

  def set_tool
      @tool = Tool.find(params[:id])
  end
end
