class CreateCollateralKindDto < BaseDto
  def initialize(name, color)
    @name = name
    @color = color
  end

  def validate_internal(params)
    params.require(:data).permit(attributes: [:name, :color])
  end

  def create_internal(params)
    CreateCollateralKindDto.new(params['name'], params['color'])
  end
end