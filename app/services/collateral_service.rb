class CollateralService
  def initialize
    @collateral_repo = CollateralRepository.new
  end
end