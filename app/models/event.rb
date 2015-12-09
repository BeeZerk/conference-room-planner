# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  allDay      :boolean
#  start       :datetime         not null
#  end         :datetime         not null
#  description :text
#  color       :string
#  creator_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"

  has_and_belongs_to_many :member, class_name: "User"

  attr_accessor :member_list

  ###############################
  ######### Validation ##########
  ###############################
  validates :start,:end, presence: true


  ###############################
  ######### Callbacks  ##########
  ###############################

  after_create :test

  ###############################
  #########   Scopes   ##########
  ###############################

  scope :participant, lambda {|participant|
                          joins(:events_users).merge(EventsUser.recipient(participant)).uniq
                    }

  scope :sort_by_newest, -> { order(start: :desc)}

  ###############################
  #########   Websocket   #######
  ###############################

  def test
    WebsocketRails.users[self.creator.id].send_message('new_notification', {:message => 'you\'ve got an upvote '})
  end

end
