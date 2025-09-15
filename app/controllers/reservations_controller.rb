class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.order(:check_in)
  end
  def show
    @reservation = Reservation.find(params[:id])
  end
end
