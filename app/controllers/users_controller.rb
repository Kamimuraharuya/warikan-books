class UsersController < ApplicationController

  before_action :logged_in_user, only: [:destroy, :index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  
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
 @microposts = @user.microposts.paginate(page: params[:page])

end

def create 
 @user = User.new(user_params)
 if @user.save
  UserMailer.account_activation(@user).deliver_now
  flash[:info] = "メールが送信されました。添付されたURLからユーザー登録を行っていください。
  （メールは約2分以内に届きます）"
  redirect_to root_url
else
  render "new"
end
end

def update
  if @user.update_attributes(user_params)
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

      def user_params
       params.require(:user).permit(:name, :email, :password,
         :password_confirmation,:image)  
     end 

     def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
