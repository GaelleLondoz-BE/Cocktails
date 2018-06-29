class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :update, :destroy]
  def index
    @cocktails_i_made = current_user.cocktails
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new

  end
  def show
    @review = Review.new
    @dose = Dose.new
    @doses = Dose.all
    @reviews = Review.order(created_at: :desc).paginate(:per_page => 3, :page => params[:page])
    # Review.paginate(:page => params[:page], :per_page => 3)

    respond_to do |format|
      format.html { render 'cocktails/show' }
      format.js
    end
  end


  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user_id = current_user.id
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end


  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end


end
