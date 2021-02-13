module Api
  module V1
    class CollateralsKindController < ApplicationController
      def index
        render json: CollateralsKind::IndexService.call
      end

      def create
        data = params.require(:data).permit(attributes: [:name, :color])['attributes']
        dto = CollateralsKind::CreateCollateralKindDto.new(data['name'], data['color'])

        render json: CollateralsKind::CreateService.call(dto)
      end

      def update
        collateral_kind = CollateralKind.find(params[:id])
        data = params.require(:data).permit(attributes: [:name, :color])['attributes']
        dto = CollateralsKind::UpdateCollateralKindDto.new(data['name'], data['color'])

        render json: CollateralsKind::UpdateService.call(collateral_kind, dto)
      end
    end
  end
end