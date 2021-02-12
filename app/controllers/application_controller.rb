class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    head :not_found
  end

  def create_dto_from_body(class_dto)
    return class_dto::create(request.body.read)
  end

  def create_dto_from_params(class_dto)
    return class_dto::create(request.params)
  end
end
