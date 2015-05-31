class DikoController < ApplicationController

  before_action :authenticate_user!
  before_action :get_room, only: [:month]

  def index
  end

  def start
    @rooms = Room.all
  end


  def month
    @events = Event.all


    # @events = Event.find_by_room(@room)
  end

  private
  def get_room
    @room = Room.find(params[:room_id])
  end
end
