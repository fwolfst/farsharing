class Admin::EmailsController < ApplicationController
  before_action :authenticate_user!

  def index
    @mails = Ahoy::Message.all
    authorize! Ahoy::Message, to: :index?, with: EmailsPolicy
  end

  def show
    @mail = Ahoy::Message.find(params[:id])
    authorize! @mail, to: :index?, with: EmailsPolicy
  end
end
