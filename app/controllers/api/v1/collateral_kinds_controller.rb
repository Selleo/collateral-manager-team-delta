module Api
  module V1
    class CollateralKindsController < ApplicationController
      def index
        render json: CollateralKinds::IndexService.call
      end

      def create
        data = params.require(:data).permit(attributes: [:name, :color])['attributes']
        dto = CollateralKinds::CreateCollateralKindDto.new(data)

        render json: CollateralKinds::CreateService.call(dto)
      end

      def update
        collateral_kind = CollateralKind.find(params[:id])
        data = params.require(:data).permit(attributes: [:name, :color])['attributes']
        dto = CollateralKinds::UpdateCollateralKindDto.new(data)

        render json: CollateralKinds::UpdateService.call(collateral_kind, dto)
      end

      def destroy
        collateral_kind = CollateralKind.find(params[:id])
        CollateralKinds::DestroyService.call(collateral_kind)

        render json: true
      end
    end
  end
end