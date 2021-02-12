class BaseDto
  def self.create(params)
    self.validate(params)

    return create_internal(params)
  end

  def self.validate(params)
    begin
      params.require(:data)
      validate_internal(params)
    rescue StandardError
      raise ValidationException.new({})
    end
  end

  def create_internal(params)
  end

  def validate_internal(params)
  end
end