class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if (current_user && (current_user.has_role?(:teacher) || current_user.has_role?(:admin)))
      path = admin_url
    elsif (current_user && current_user.has_role?(:student))
      path = bilan_index_url
    else
      path = root_url
    end
    redirect_to path, :alert => exception.message
  end

  
end