# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  allDay      :boolean
#  start       :datetime
#  end         :datetime
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



end
