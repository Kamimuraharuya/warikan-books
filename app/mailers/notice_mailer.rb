class NoticeMailer < ApplicationMailer


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.chat_created.subject
  #
  def chat_created(hostman, participant)
    @user = hostman
    @users = participant
    mail to: hostman.email,  subject: "ワリカン成立"
    mail to: participant.email, subject: "ワリカン成立"
  end
end
