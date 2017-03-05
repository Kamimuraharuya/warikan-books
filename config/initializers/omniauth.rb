  if Rails.env.production?
  	Rails.application.config.middleware.use OmniAuth::Builder do
  		provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  	end
  else
  	Rails.application.config.middleware.use OmniAuth::Builder do
  		provider :facebook, ENV['1854927711451676'], ENV['585a96bf81f7e3330202ef1a23291128']
  	end
  end
#とりあえずローカルで登録。本番用は、分岐させて、heroku config:setする