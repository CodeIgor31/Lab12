class SessionsController < ApplicationController
  before_action :no_autorize, only: %i[new create]
  before_action :autorize, only: :destroy
  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Успешный вход"
      redirect_to form_path
    else
      flash[:warning] = "Неправильный email или пароль"
      redirect_to home_path
    end
  end

  def destroy
    session.delete :user_id
    flash[:success] = "Успешный выход"
    redirect_to home_path
  end

end
