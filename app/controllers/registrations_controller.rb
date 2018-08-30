class RegistrationsController < Devise::RegistrationsController
  def qualified
    @user = current_user
  end


  protected

  def after_update_path_for(resource)
    if session[:last_offer_id]
      offer_path(session[:last_offer_id])
    else
      root_path
    end
  end


end
