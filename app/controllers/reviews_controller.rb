class ReviewsController < ApplicationController
  def create
    @tool = Tool.find(params[:tool_id])
    @review = Review.new(review_params)
    @review.tool = @tool
    @review.user = current_user
    
    if @review.save
      redirect_to tool_path(@tool, anchor: "review-#{@review.id}")
    else
      render 'tools/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
