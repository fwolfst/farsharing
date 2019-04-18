class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_current_user
  before_action :add_demo_notice
  verify_authorized unless: :devise_controller?

  private

  def set_current_user
    Current.user = current_user
  end

  def add_demo_notice
    helpers.add_flash warning: t('demo')
  end
end
