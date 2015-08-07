module ApplicationHelper
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource
    @resource ||= User.new
  end

  def resource_name
    :user
  end
end
