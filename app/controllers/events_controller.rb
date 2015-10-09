class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  autocomplete :user, :slug, :full => true

  ######################################################
  ################## Default Methods   #################
  ######################################################
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create

    prms = event_params

    prms[:start] = DateTime.parse(event_params[:start])
    @event = Event.new(prms)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  ######################################################
  ################## Custom Methods   ##################
  ######################################################

  def fast_create_event
    @event = Event.new(event_params)
    @event.creator_id = current_user.id

    member = Array.new

    event_params[:member_list].split(",").map {|user_slug|
      member.push(User.find_by_slug(user_slug))
    }
    @event.member << member

    respond_to do |format|
      if @event.save
        format.html { redirect_to :back, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def events_today
    @selected = Item.where(:category_id => params[:cat_id])
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      out = params.require(:event).permit(:title, :description, :start, :end, :allDay, :member_list)
      out[:start] = DateTime.strptime(out[:start], '%m.%d.%Y - %I:%M %p')
      out[:end] = DateTime.strptime(out[:end], '%m.%d.%Y - %I:%M %p')
      out
    end
end
