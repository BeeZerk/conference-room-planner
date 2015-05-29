class DikoController < ApplicationController

  before_action :authenticate_user!, :except => :index

  def index

  end

  def start
    @rooms = Room.all
  end


  def month
    @events = Event.all
  end
end
