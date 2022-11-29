class UsersController < ApplicationController
  before_action :no_autorize, only: %i[new create]
  before_action :autorize, only: %i[edit update]
  before_action :set_user, only: %i[edit update destroy]

  def index
  end

  def show
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Добро пожаловать, #{@user.login}!"
      redirect_to form_path
    else
      redirect_to new_user_path, notice: 'Пароли не совпадают' 
    end
  end

  def update
    if current_user.update user_params
      flash[:success] = 'Профиль обновлен'
      redirect_to edit_user_path(current_user)
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :login, :password, :password_confirmation)
    end
end
