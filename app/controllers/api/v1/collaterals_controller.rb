module Api
  module V1
    class CollateralsController < ApiController
      def index
        render json: Collaterals::IndexService.call
      end

      def show
        collateral_id = params[:id]

        render json: Collaterals::ShowService.call(collateral_id)
      end

      def create
        data = params.require(:data).permit(attributes: [:name, :kind_id, :url])['attributes']
        dto = Collaterals::CreateCollateralDto.new(data)

        render json: Collaterals::CreateService.call(dto)
      end

      def update
        collateral = Collateral.find(params[:id])
        data = params.require(:data).permit(attributes: [:name, :kind_id, :url])['attributes']
        dto = Collaterals::UpdateCollateralDto.new(data)

        render json: Collaterals::UpdateService.call(collateral, dto)
      end

      def destroy
        collateral = Collateral.find(params[:id])
        Collaterals::DestroyService.call(collateral)

        render json: true
      end
    end
  end
end
