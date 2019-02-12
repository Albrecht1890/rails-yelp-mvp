class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      redirect_to new_restaurant_review_path(params[:restaurant_id])
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
