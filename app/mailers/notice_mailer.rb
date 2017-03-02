class NoticeMailer < ApplicationMailer


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.chat_created.subject
  #
  def chat_created(user, emails, micropost,users)
    @user = user #メール送る先のユーザだけのActiverecordになってる
    @emails = emails #文字列のアドレス
    @micropost = micropost
    @users = users
    mail to: user.email, subject: "ワリカン成立"
  end
end

