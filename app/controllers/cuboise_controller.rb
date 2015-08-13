class CuboiseController < ApplicationController

  before_action :authenticate_user!, except: :home
  before_action :has_profile
  def index
  end

  def dashboard

  end

  def start
    @calendars = Calendar.where(:owner => current_user)
  end
end
