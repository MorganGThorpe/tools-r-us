class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tools = @user.tools
    @bookings = @user.bookings
  end

  def index
    @user = User.geocoded

    @markers = floats.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  private

  # def user_params
  #   params.require(:user).permit(:address)
  # end

end
