class CuboiseController < ApplicationController

  before_action :authenticate_user!
  before_action :get_room, only: [:month]

  def index
  end

  def start
    @calendars = Calendar.where(:owner => current_user)
  end
end
