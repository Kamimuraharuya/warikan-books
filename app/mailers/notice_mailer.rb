class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.chat_created.subject
  #
  def chat_created(hostman, participant)
    #hostman = User.find_by(:id => @micropost.user.id)
    #participant = User.find_by(:id => @likes.user_id)   
    mail to: hostman.email, subject: "ワリカン成立"
    mail to: participant.email, subject: "ワリカン成立"
  end
end
