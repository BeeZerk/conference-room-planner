# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  uuid                   :string(36)
#  username               :string           not null
#  avatar                 :string
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  admin                  :boolean          default(FALSE)
#  attachment             :string
#  active                 :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  require 'securerandom'
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
        :username,
        [:username, SecureRandom.hex(3)]
    ]
  end

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_and_belongs_to_many :events

  ###social
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable
  acts_as_mentionable

  #######################################
  ### Messageable
  #######################################
  acts_as_messageable
  def name
    self.username
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    "define_email@on_your.model"
    #if false
    #return nil
  end


  has_many :identities
  has_and_belongs_to_many :events
  has_and_belongs_to_many :calendars

  #######################################
  ### Callbacks
  #######################################

  before_create do
  end

  before_save do
    self.active = TRUE #todo: DEVELOPMENT
    if self.avatar.blank?
      self.avatar = 'http://commonstake.com/assets/default_profile-ecc3c84b92d34c13cd58ceca305f2336.jpg'
    end
  end

  #######################################
  ### Validation
  #######################################

  #######################################
  ### Methods
  #######################################
  scope :name_like, -> (name) { where("username ilike ?", name)}


  def twitter
    identities.where( :provider => "twitter" ).first
  end

  def twitter_client
    @twitter_client ||= Twitter.client( access_token: twitter.accesstoken )
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end


  private
  def create_calendar
    Calendar.create(
                name: "My Calendar",
                color: "#323299",
                owner_id: self.id
    )
  end



end
