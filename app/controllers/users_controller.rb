class UsersController < ApplicationController

  before_action :logged_in_user, only: [:destroy, :index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :edit_forcing, only: [:destroy, :index, :show]
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  def index
    @users = User.all.paginate(page: params[:page])
  end
#    @users = User.where(activated:FILL_IN).paginate(page: params[:page])

def edit
end

def new
 @user = User.new
end


def show 
  @user = User.find(params[:id])
  microposts = @user.microposts
  microposts_id = []
  microposts_id = microposts.pluck(:id)
  likes = @user.likes
  likes_id = likes.pluck(:micropost_id)
  microposts_id << likes_id 
  @microposts = Micropost.where(id: microposts_id).paginate(page: params[:page])
end

def create 
  if env['omniauth.auth'].present?
            # Facebookログイン--とりあえずこの分岐で全部終わらす
            @user  = User.from_omniauth(env['omniauth.auth'])
            result = @user.save(context: :facebook_login)
            fb       = "Facebook"#のちの分岐に備えて
            if result
              sign_in @user
              flash[:success] = "#{fb}ログインしました。" 
            redirect_to @user#後でエディットに飛ばすー好きな本とか
          else
            redirect_to auth_failure_path
          end
        else#通常ログインそのまま　　
 @user = User.new(user_params)#paramsで得る情報をuserモデルで編集せねば
 if @user.save
  UserMailer.account_activation(@user).deliver_now
  flash[:info] = "メールが送信されました。添付されたURLからユーザー登録を行っていください。
  （メールは約2分以内に届きます）"
  redirect_to root_url
else
  render "new"
end
end
end

def update
  @user = User.find(params[:id])
  if @user.update(update_params)#Facebookやとパスワードがない
          # 更新に成功した場合を扱う。
          flash[:success] = "プロフィールが更新されました"
          redirect_to @user
        else
          render "edit"
        end
      end
      


      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user?(@user)
      end

      private

      def update_params
        params.require(:user).permit(:name, :email, :password,
         :password_confirmation,:image,:university,:major,:favorite_book,:content)
      end  

      def user_params
       params.require(:user).permit(:name, :email, :password,
         :password_confirmation,:image)  
     end 

     def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
