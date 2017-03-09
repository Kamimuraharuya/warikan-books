class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest

	#2個目のselfは省略可能
	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 50},
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :image, presence: true  
  validate :image_size
  validates :password, presence: false, on: :facebook_login
  validates :content, :major, :university, :favorite_book, presence: true, length: { maximum: 140 }

  def self.from_omniauth(auth)
        # emailの提供は必須とする
        user = User.where('email = ?', auth.info.email).first
        if user.blank?
          user = User.new
        end
        user.uid   = auth.uid
        user.name  = auth.info.name
        user.email = auth.info.email
        user.image  = auth.info.image
        user.description = auth.info.description#validatesで長さ絞るlater
        user.oauth_token      = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        #outh_tokenについてはわからない。多分向こうで使ってくれる
        #outh_secretはいらないの？
        #なんのuser?これ
      end



      def feed
        Micropost.where("user_id = ?", id)
      end

      def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)

      end
      def User.new_token
        SecureRandom.urlsafe_base64
      end
      def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
      end

   # 渡されたトークンがダイジェストと一致したらtrueを返す.ここでのリメトーはローカル変数
   def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end 

  # ユーザーのログイン情報を破棄する
  def forget
  	update_attribute(:remember_digest, nil)
  end
# パスワード再設定の期限が切れている場合はtrueを返す
def password_reset_expired?
  reset_sent_at < 2.hours.ago
end
# アカウントを有効にする
def activate
	update_columns(activated: true, activated_at: Time.zone.now)
end

  # 有効化用のメールを送信する
  def send_activation_email
  	UserMailer.account_activation(self).deliver_now
  end

  # パスワード再設定の属性を設定する
  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token) , reset_sent_at: Time.zone.now)
  end

  # パスワード再設定のメールを送信する
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  private
    # メールアドレスをすべて小文字にする
    def downcase_email
    	self.email = email.downcase
    end

    # 有効化トークンとダイジェストを作成および代入する
    def create_activation_digest
    	self.activation_token  = User.new_token
    	self.activation_digest = User.digest(activation_token)
    end

    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end    

  end
