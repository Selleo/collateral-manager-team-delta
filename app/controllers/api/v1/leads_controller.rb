module Api
  module V1
    class LeadsController < ApplicationController
      def index
        render json: Leads::IndexService.call
      end

      def show
        collateral_id = params[:id]

        render json: Leads::ShowService.call(collateral_id)
      end

      def create
        data = params.require(:data).permit(attributes: [:name, :kind_id, :url])['attributes']
        dto = Leads::CreateLeadDto.new(data)

        render json: Leads::CreateService.call(dto)
      end

      def update
        collateral = Leads.find(params[:id])
        data = params.require(:data).permit(attributes: [:name, :tags])['attributes']
        dto = Leads::UpdateCollateralDto.new(data)

        render json: Leads::UpdateService.call(collateral, dto)
      end

      def destroy
        collateral = Leads.find(params[:id])
        Leads::DestroyService.call(collateral)

        render json: true
      end
    end
  end
end

