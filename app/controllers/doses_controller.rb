class DosesController < ApplicationController

	def new
		@dose = Dose.new
		@cocktail = Cocktail.find(params[:cocktail_id])
	end

	def create
		@dose = Dose.new(dose_params)
		@dose.cocktail = Cocktail.find(params[:cocktail_id])

		@dose.save

		redirect_to cocktail_path(Cocktail.find(params[:cocktail_id]))
	end


	def destroy
		@dose = Dose.new(dose_params)
		@dose.cocktail = Cocktail.find(params[:cocktail_id])

		@dose.destroy
    # no need for app/views/restaurants/destroy.html.erb
		redirect_to cocktails_path
	end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

end
