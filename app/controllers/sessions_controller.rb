class SessionsController < ApplicationController

	def create
		#redirect_to :controller => "users", :action => "dashboard"
		if user_params["username"] && user_params["password"]
			 user = User.where(username: user_params["username"].downcase).first
			if user && user.authenticate(user_params["password"])
				sign_in user
				flash[:notice] = "Welcome #{user_params["username"]}"
				return redirect_to dashboard_path
			else
				flash[:error] = "Incorrect Login details. Please try again"
				return render "signin"
			end
		else
				flash[:error] = "Fields cannot be empty. Please try again"
				return render "signin"
		end	
	end

	def signin

	end

	def destroy
		sign_out
		flash[:error] = "You have successfully logged out"
		redirect_to :root
	end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:session).permit(:username, :password)
    end
end
