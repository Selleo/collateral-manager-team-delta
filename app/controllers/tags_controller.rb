# module Views
        class TagsController < ApplicationController
            skip_before_action :verify_authenticity_token

            def index
                @tags = Tag.all
                # render 'tags'
            end

        end
# end
