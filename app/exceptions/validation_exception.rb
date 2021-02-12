class ValidationException < StandardError
  def initialize(msg = "Invalid payload")
    super
  end
end