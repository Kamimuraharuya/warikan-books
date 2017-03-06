class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
    include SessionsHelper #ナンジャコリャ（８．２）

    private
    def logged_in_user
    	unless logged_in?
    		store_location
    		flash[:danger] = "ログインしてください"
    		redirect_to login_url
    	end
    end

    def edit_forcing
        if current_user.major.empty?
            store_location
            flash[:danger] = "ユーザー情報を入力してください"
            redirect_to edit_user_path(params[:id])
        end
    end
end
