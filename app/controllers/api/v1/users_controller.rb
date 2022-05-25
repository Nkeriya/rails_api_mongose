class Api::V1::UsersController < Api::BaseController
  before_action :user, only: [:update, :destory]

  def index
    users = User.all #.includes(:articles)
    render json: users, status: 200
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: {message: 'user cant be created'}
    end
  end

  def update
    if user.update(user_params)
      render json: user, status: 200
    else
      render json: {message: 'user cant be updated'}
    end
  end

  def destroy
    if user.destroy
      render json: {message: 'user deleted'}, status: 200
    else
      render json: {message: 'user cant be deleted'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :phone_number)
  end

  def user
    @user ||= User.find(params[:id])
  end
end
