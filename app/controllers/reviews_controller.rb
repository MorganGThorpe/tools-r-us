class ReviewsController < ApplicationController
  before_action :set_tool, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.tool = @tool
    @review.save

    redirect_to tool_path(@tool)
  end

  private

  def set_tool
    @tool = Tool.find(params[:tool_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
