class CuboiseController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def start
    @calendars = Calendar.where(:owner => current_user)
  end
end
