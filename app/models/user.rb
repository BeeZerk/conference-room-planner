class User < ActiveRecord::Base
  require 'securerandom'

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  ###social
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable
  acts_as_mentionable


  has_many :identities
  has_and_belongs_to_many :events
  has_and_belongs_to_many :calendars

  #######################################
  ### Callbacks
  #######################################

  before_create do
    self.uuid = SecureRandom.uuid
  end

  before_save do
    self.active = TRUE #todo: DEVELOPMENT
  end

  #######################################
  ### Validation
  #######################################

  #######################################
  ### Methods
  #######################################

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
