class TosAcceptancesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.update(terms_accepted_at: DateTime.now)
    redirect_to root_path
  end
end
