
module Api
    module V1
      class TagsController < ApplicationController
        protect_from_forgery with: :null_session

        def index
          tags = Tag.all
  
          render json: TagSerializer.new(tags, options).serialized_json
        end

        def show
            tag = Tag.find_by(slug: params[:slug])

            render json: TagSerializer.new(tag, options).serialized_json
        end

        def create
            tag = Tag.new(tag_params)
    
            if tag.save
              render json: TagSerializer.new(tag).serialized_json
            else
              render json: { error: tag.errors.messages }, status: 422
            end
        end

        def update
            tag = Tag.find_by(slug: params[:slug])
    
            if tag.update(tag_params)
              render json: TagSerializer.new(tag, options).serialized_json
            else
              render json: { error: tag.errors.messages }, status: 422
            end
        end

        def destroy
            tag = Tag.find_by(slug: params[:slug])
  
            if tag.destroy
              head :no_content
            else
              render json: { errors: tag.errors }, status: 422
            end
        end

        private

        def tag_params
          params.require(:tag).permit(:name, :slug)
        end

        def options
            @options ||= { include: %i[posts] }
        end
      end
    end
  end