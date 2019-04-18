class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_current_user
  before_action :add_demo_notice

  before_action :configure_permitted_parameters, if: :devise_controller?

  verify_authorized unless: :devise_controller?

  private

  def set_current_user
    Current.user = current_user
  end

  def add_demo_notice
    helpers.add_flash warning: t('demo')
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :tos_agreement])
  end
end
