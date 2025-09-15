class RoomsController < ApplicationController
  def index
    @rooms = Room.order(:number)
  end

  def show
    @room = Room.find(params[:id])
  end
end
