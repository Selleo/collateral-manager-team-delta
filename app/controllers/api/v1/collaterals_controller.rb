module Api
  module V1
    class CollateralsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        render json: Collaterals::IndexService.call
      end

      def show
        render json: collateral
      end

      def create
        render json: Collaterals::CreateService.call(collateral_params)
      end

      def update
        render json: Collaterals::UpdateService.call(collateral, collateral_params)
      end

      def destroy
        collateral.destroy
        render json: true
      end

      private
      def collateral_params
        params.require(:data).permit(attributes: [:name, :kind, :url])
      end

      def collateral
        Collateral.find(params[:id])
      end
    end
  end
end
