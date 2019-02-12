class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    raise
    @review = Review.new(params_review)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save
  end
end
