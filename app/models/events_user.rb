# == Schema Information
#
# Table name: events_users
#
#  id       :integer          not null, primary key
#  event_id :integer          not null
#  user_id  :integer          not null
#  admin    :boolean          default(FALSE)
#

class EventsUser < ActiveRecord::Base

  ###############################
  #########   Scopes   ##########
  ###############################
  scope :recipient, lambda { |recipient|
                    where(:user_id => recipient.id)
                  }
end
