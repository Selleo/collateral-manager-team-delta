module Api
    module V1
        class TagsController < ApplicationController
            skip_before_action :verify_authenticity_token

            def index
                render json: Tags::IndexService.call
            end

            def create
                render json: Tags::CreateService.call(tag_params)
            end

            private
            def tag_params
              params.require(:data).permit(attributes: [:name])
            end
        end
    end
end
