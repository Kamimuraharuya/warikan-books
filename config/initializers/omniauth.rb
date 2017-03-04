Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
#とりあえずローカルで登録。本番用は、分岐させて、heroku config:setする