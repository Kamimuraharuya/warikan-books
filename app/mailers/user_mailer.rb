class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def chat_created(user)
    user = User.first
  #participant =  BさんとCさん（そのポストにlikeつけてる人）
    mail to: user.mail, subject: "ワリカン成立"
    #mail to: participant.mail, subject: "ワリカン成立"
  end


  def account_activation(user)
    @user = user
    mail to: user.email, subject: "アカウント登録だよ"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
@user = user
    mail to: user.email, subject: "Password reset"
  end
end
