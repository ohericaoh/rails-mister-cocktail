class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end

  # def update
  #    if @cocktail.update(cocktail_params)
  #     redirect_to @cocktail, notice: 'Cocktail was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_url, notice: 'Cocktail was successfully destroyed.'
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end


#pseudocode
# user is at main page (/cocktails)
# then they click a button to create a new cocktail (/cocktails/new)
# user creates cocktail with a form (inputs: name) presses submit (saves cocktail to db - redirects to show page (/cocktails/id)
# Next user adds doses to created cocktail (/cocktails/1) by pressing button to create dose (/cocktails/id/doses/new)
# (/cocktails/id/doses/new) Takes to Doses new page with a form with dose description and drop down list of ingredients (cocktail id will be taken from params)
# After creating new dose, redirect to cocktails/id page


