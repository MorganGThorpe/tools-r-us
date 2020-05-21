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
    @booking_cost = @booking.booking_cost
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to tool_path(@tool)
    end
  end

  def show
    @booking = Booking.find(params[:id])
    if current_user == @booking.user
      @tool = @booking.tool
    else
      redirect_to tool_path(@tool), notice: "Access denied"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @tool = Tool.find(params[:tool_id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
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
