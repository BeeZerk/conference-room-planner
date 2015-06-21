class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :events
  has_and_belongs_to_many :calendars


  after_create :create_calendar

  private
  def create_calendar
    Calendar.create(
                name: "My Calendar",
                color: "#323299",
                owner_id: self.id
    )
  end


end
