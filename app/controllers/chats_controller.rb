class ChatsController < ApplicationController
	def show 
		@chats = Chat.chat_list
		@chat = Chat.new
	end

	

	def create
		@chat = Chat.new(params.require(:chat).permit(:person_name, :body))
		if @chat.save
			redirect_to(:back)
		else
			@chats = Chat.chat_list
			redirect_to(:back)
		end
	end

end