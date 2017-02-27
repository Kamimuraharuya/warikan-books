require 'test_helper'

class ChatCreatedTest < ActionDispatch::IntegrationTest
  
test "chat_created test" do

	get(create, micropost:{content: "OK",bookname: "美味しい本",area: "京大", bookprice: 2444, day: 3, kakikomi: "なし",person_number: 2, micropost_id: 1})


	assert_response :redirect

	assert_redirect_to controller: :microposts, action: :show, id: 900
end

end

def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to micropost_path, id: :@micropost.micropost_id
		else
			@feed_items = []
			redirect_to microposts_tatiage_path
		end
	end
