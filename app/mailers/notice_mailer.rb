class NoticeMailer < ApplicationMailer


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.chat_created.subject
  #
   def chat_created(user, emails)
    @user = user
    @emails = emails
    mail to: user.email, subject: "ワリカン成立"
  end
end

