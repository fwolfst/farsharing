class ApplicationController < ActionController::Base
  include Pagy::Backend
  include FlashHelper

  before_action :set_current_user
  before_action :add_demo_notice

  before_action :force_tos_accept!, unless: [:devise_controller?, :tos_path]
  before_action :configure_permitted_parameters, if: :devise_controller?

  verify_authorized unless: [:devise_controller?, :tos_path]

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

  def force_tos_accept!
    if !current_user.admin && !current_user.terms_accepted_at
      helpers.add_flash failure: t(':need_to_accept_to_use_service')
      redirect_to tos_path
    end
  end
end
