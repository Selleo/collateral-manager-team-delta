# module Views
        class TagsController < ApplicationController
            # skip_before_action :verify_authenticity_token

            def index
                @tags = Tag.all
                # render 'tags'
            end

            # def create
            #     tag_name = params[:name]
            #     tag = Tag.new({name: tag_name})
            #     tag.save
            #     render json: tag
            # end
        end
# end
