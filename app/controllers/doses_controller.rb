class DosesController < ApplicationController

	def new
		@cocktail = Cocktail.find(params[:cocktail_id])
		@dose = Dose.new
	end

	def create
		@dose = Dose.new(dose_params)
		@dose.cocktail = Cocktail.find(params[:cocktail_id])
			if @dose.save
				redirect_to cocktail_path(Cocktail.find(params[:cocktail_id]))
			else
				render :new
			end
	end

	def destroy
		set_dose
		@cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
		@dose.destroy
    # no need for app/views/restaurants/destroy.html.erb
		redirect_to cocktail_path(@cocktail)
		

		######## OR alternate method ########

		# def destroy
				
		#     @dose = Dose.find(params[:id])
		# 		@dose.destroy
		#     # no need for app/views/restaurants/destroy.html.erb
		# 		redirect_to cocktail_path(Cocktail.find(params[:cocktail_id]))
		# end

	end

  private
  
  def set_dose
  	@dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
