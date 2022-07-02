class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :new_registration_form, only: [:new], if: -> { controller_name == "registrations" }

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :group])
  end

  def new_registration_form
    @registration_form = UserRegistrationForm.new
  end

end
