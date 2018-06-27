class ReviewsController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    
    @reviews = Review.order(created_at: :desc).paginate(:per_page => 3, :page => params[:page])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail

    if @review.save
      respond_to do |format|
        format.html { redirect_to cocktail_path(@cocktail) }
        format.js
      end

    else
      respond_to do |format|
        format.html { render 'cocktails/show' }
        format.js
      end
    end

  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end


