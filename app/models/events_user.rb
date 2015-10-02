# == Schema Information
#
# Table name: events_members
#
#  id        :integer          not null, primary key
#  event_id  :integer          not null
#  member_id :integer          not null
#  admin     :boolean          default(FALSE)
#

class EventsUser < ActiveRecord::Base
end
