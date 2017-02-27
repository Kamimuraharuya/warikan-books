require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "chat_created" do
    mail = NoticeMailer.chat_created
    assert_equal ["example@railstutorial.org"], mail.to
  end

end
