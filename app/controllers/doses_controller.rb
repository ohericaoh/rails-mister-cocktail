class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

   if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      # puts "Dose not saved! #{@dose.errors.full_messages}"
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end

#PSEUDOCODE

# User is at main index page (/cocktails)
# They click button to create a new cocktail, this takes them to (/cocktails/new)

# User creates a cocktail with form (input: name), submits which saves cocktail to db and redirects to show page (/cocktails/id)

# User adds doses to newly created cocktail (we are at /cocktails/id) but pressing button to create dose (/cocktails/id/doses/new)

# This takes them to doses new page with form with dose description input and drop down list of ingredients (cocktail id will be taken from params)

# After creating new dose, they are redirected to cocktails/id page
