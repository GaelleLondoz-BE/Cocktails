class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail
    else
      redirect_to @cocktail
    end
  end

  def destroy
    @cocktail = Cocktail.find(@dose.cocktail_id)
    @dose.destroy
    redirect_to @cocktail
  end

  private
  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id )
  end


end
