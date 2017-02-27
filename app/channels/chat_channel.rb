# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
        stream_from 'chat:message' #ここが変わった

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

   def put_message
    ChatChannel.broadcast_to('message', 'hello')
  end
end
