class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			user.activate
			log_in user
			params[:session][:remember_me] == '1' ? remember(user) : forget(user)
			redirect_to root_url
		else
			flash.now[:danger] = '誤ったパスワードとメールアドレスの組み合わせです' 
			render 'new'
		end
	end
#２個のページの時対策
def destroy
	log_out if logged_in?
	redirect_to root_url
end
end
