class ReviewsController < ApplicationController

def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end

def create
if @review = Review.new(review_params)
@review.restaurant = Restaurant.find(params[:restaurant_id])
@review.save
else
render :new
end
end

private

def review_params
params.require(:review).permit(:content)
end

end
