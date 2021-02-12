module Api
  module V1
    class CollateralsController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
        render json: collection
      end

      def show
        collateral = Collateral.find_by!(id: params[:id])
        render json: collateral
      end

      def create
        collateral = Collaterals::CreateService.call(create_params)
        render json: collateral
      end

      private
      def collection
        Collateral.all.map do |collateral|
          {
            **collateral.attributes.symbolize_keys.slice(:id, :name, :kind, :url),
          }
        end
      end

      def create_params
        params.require(:data).permit(attributes: [:name, :kind, :url])
      end
    end
  end
end
