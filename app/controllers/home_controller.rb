class HomeController < ApplicationController
	def show
		if params[:page_name] == 'welcome'
		@skip_normal_bar = true
		end 
		respond_to do |format|
      format.html
      
    end
	end

	def edit_user_admin

			

      myUser = User.find(params[:id])

      if(params[:bool] == 't')
        myUser.update_attributes!(admin: true)
     
      else
      	
          myUser.update_attributes!(admin: false)
      end

    redirect_to request.referrer, notice:  "#{myUser.email} Admin settings updated"
	end

end
