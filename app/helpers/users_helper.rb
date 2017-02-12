module UsersHelper
	def gravatar_for(user, options = {size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    #ここらへん理解してない。
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    #オプション引数

    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
