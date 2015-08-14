class CuboiseController < ApplicationController

  before_action :authenticate_user!, except: :home
  def index
  end

  def dashboard

  end

  def start
    @calendars = Calendar.where(:owner => current_user)
  end
end
