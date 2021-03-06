class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    head :not_found
  end
end
