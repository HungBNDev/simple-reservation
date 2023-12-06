class ReservationsController < ApplicationController
  def new;end

  def create
    results = Reservations::Calculator.new(number_of_guests: permitted_params[:number_of_guests]).call

    redirect_to action: :index, results: results
  end

  def index
    @results = preprocess(params[:results])
  end

  private

  def permitted_params
    params.permit(:number_of_guests)
  end

  def preprocess(params)
    return "There is no option" if params[:no_option] == "true"

    str_room_result = []
    params[:allocated].each do |key, value|
      next if value.to_i.zero?

      str_room_result << "#{value} * #{key.to_s.capitalize}"
    end

    str_room_result.join(" + ") + " = " + "Total: $#{params[:price]}"
  end
end
