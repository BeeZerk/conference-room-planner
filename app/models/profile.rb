class Profile < ActiveRecord::Base


  mount_uploader :avatar, AvatarUploader

  belongs_to :user

  #######################################
  ### Callbacks
  #######################################
  before_validation :generate_slug

  #######################################
  ### Validation
  #######################################
  validates :slug,
            presence: true,
            uniqueness: true


  #######################################
  ### Methods
  #######################################
  private
  def generate_slug
    self.slug = username.parameterize
  end


end
