class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

	def index
		@cocktails = Cocktail.all
	end

	def show
		# must pass instances to show method
		@dose = Dose.new
		@ingredients = Ingredient.all

	end

  def edit
    # ...
  end

  def update
    # ...
  end

  def destroy
    # ...
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
      @cocktail = Cocktail.new(cocktail_params)
      @cocktail.save
   
      redirect_to cocktails_path(@cocktail)
      
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
