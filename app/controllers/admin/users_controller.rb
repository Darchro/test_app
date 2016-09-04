class Admin::UsersController < Admin::BaseController
  before_action :find_admin
	def index
		@users = User.all
	end

  def show
    @user = User.find_by(id: params[:id])
  end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
  	@user = User.find_by(id: params[:id])
  	@user.destroy
  	redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end

    def find_admin
      @admin = Admin.find_by(id: session[:admin_id])
      redirect_to admin_login_path unless @admin
    end 
end