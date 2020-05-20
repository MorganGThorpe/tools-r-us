class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_tool, only: [:show, :edit, :destroy, :update ]

  def index
    if  params[:tool][:name].present?
      @tools = Tool.where("name ILIKE ?", "%#{params[:tool][:name]}%")
    else
      @tools = Tool.all
    end
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def show
    @tool
  end

  def edit
    @tool
  end

  def update
    @tool.update(tool_params)
    redirect_to tool_path(@tool)
  end

  def destroy
    @tool.destroy
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :active, :price_per_day, :category)
  end

  def set_tool
      @tool = Tool.find(params[:id])
  end
end
