class ToolsController < ApplicationController
  before_action :set_tool
  def index
    @tool = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.create(tool_params)
    if @tool.save
      redirect_to_tool_path(@tool)
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
    redirect_to_tool_path(@tool)
  end

  def destroy
    @tool.destroy
    redirect_to_root_path
  end

  private

  def tool_params
    params:require(:tool).permit(:name, :description, :active, :price, :categories)
  end

  def set_tool
    @tool = Tool.find(params[:id])
  end
end
