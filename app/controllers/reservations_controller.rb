class ReservationsController < ApplicationController
  def new;end

  def create
    redirect_to action: :index, number_of_guests: params[:number_of_guests]
  end

  def index
    @results = Reservations::Calculator.new(number_of_guests: params[:number_of_guests]).display_results
  end

  private

  def permitted_params
    params.permit(:number_of_guests)
  end
end
