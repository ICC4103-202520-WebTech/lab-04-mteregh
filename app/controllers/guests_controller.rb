class GuestsController < ApplicationController
  def index
    @guests = Guest.order(:last_name, :first_name)
  end

  def show
    @guest = Guest.find(params[:id])
  end
end
