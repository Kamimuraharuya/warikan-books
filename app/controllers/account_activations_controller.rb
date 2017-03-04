class AccountActivationsController < ApplicationController

def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "アカウントが作成されました！"
      redirect_to user
      #rememberで覚えさせたい
    else
      flash[:danger] = "期限の切れたリンクです！もう一度登録し直してください"
      redirect_to root_url
    end
  end

end
