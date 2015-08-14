class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, validate: true
  accepts_nested_attributes_for :profile, :allow_destroy => true
  has_and_belongs_to_many :events
  has_and_belongs_to_many :calendars



  #######################################
  ### Callbacks
  #######################################
  before_save do
    self.active = TRUE #todo: DEVELOPMENT
  end

  #######################################
  ### Validation
  #######################################

  #######################################
  ### Methods
  #######################################
  private
  def create_calendar
    Calendar.create(
                name: "My Calendar",
                color: "#323299",
                owner_id: self.id
    )
  end



end
