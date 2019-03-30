class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_current_user
  verify_authorized unless: :devise_controller?

  private

  def set_current_user
    Current.user = current_user
  end
end
