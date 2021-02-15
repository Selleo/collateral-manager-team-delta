module Api
    module V1
        class TagsController < ApplicationController
            skip_before_action :verify_authenticity_token

            def index
                render json: Tag.all
            end

            def create
                tag_name = params[:name]
                tag = Tag.new({name: tag_name})
                tag.save
                render json: tag
            end
        end
    end
end
