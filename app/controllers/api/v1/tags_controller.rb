module Api
  module V1
    class TagsController < ApplicationController
      def index
        render json: Tags::IndexService.call
      end

      def create
        data = params.require(:data).permit(attributes: [:name, :color])['attributes']
        dto = Tags::CreateTagDto.new(data)

        render json: Tags::CreateService.call(dto)
      end

      def update
        tag = Tag.find(params[:id])
        data = params.require(:data).permit(attributes: [:name, :color])['attributes']
        dto = Tags::UpdateTagDto.new(data)

        render json: Tags::UpdateService.call(tag, dto)
      end
    end
  end
end
