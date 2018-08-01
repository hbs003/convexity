class ReviewsController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @enterprise = Enterprise.find(params[:enterprise_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.enterprise = Enterprise.find(params[:enterprise_id])
    @review.save

  end

  private

  def review_params
    params.require(:review).permit(:content, :title)
  end
end
