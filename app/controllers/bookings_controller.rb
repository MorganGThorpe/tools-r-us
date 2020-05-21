class BookingsController < ApplicationController

  def index
    @booking = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
    @tool = Tool.find(params[:tool_id])
  end

  def create
    @tool = Tool.find(params[:tool_id])
    @booking = Booking.new(booking_params)
    @booking.tool = @tool
    @booking.user = current_user

    if @booking.start_date && @booking.end_date
      @booking.booking_cost = (@booking.start_date - @booking.end_date).to_f * @booking.tool.price_per_day
    else
      @booking.booking_cost = 0
    end

    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to tool_path(@tool)
    end
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :booking_cost)
  end

  def set_bookings
    @booking = Booking.find(params[:id])
  end
end
