class ApplicationController < ActionController::Base
  verify_authorized unless: :devise_controller?
end
