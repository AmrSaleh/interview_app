class HomeController < ApplicationController
	def show
		@skip_normal_bar = true
		
		respond_to do |format|
      format.html
      
    end
	end
end
