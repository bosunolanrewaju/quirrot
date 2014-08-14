module SessionsHelper

	def sign_in(user)
		session[:current_user_id] = user.id
		session[:name] = user.username
		cookies[:username] = user.username
		current_user
	end

	def current_user
		User.find_by_id(session[:current_user_id])
	end

	def sign_out
		cookies.delete(:username)
		session[:current_user_id] = nil
	end
end
