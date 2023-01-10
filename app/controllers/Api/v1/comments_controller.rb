module Api
    module V1
      class CommentsController < ApplicationController
        protect_from_forgery with: :null_session

        def index
          comments = Comment.all
  
          render json: CommentSerializer.new(comments).serialized_json
        end

        def create
          comment = Comment.new(comment_params)
  
          if comment.save
            render json: CommentSerializer.new(comment).serialized_json
          else
            render json: { errors: comment.errors.messages }, status: 422
          end
        end

        def show
          comment = Comment.find(params[:id])
  
          render json: CommentSerializer.new(comment).serialized_json
        end
        
        def destroy
          comment = Comment.find(params[:id])
  
          if comment.destroy
            head :no_content
          else
            render json: { errors: comment.errors.messages }, status: 422
          end
        end

        def update
          comment = Comment.find(params[:id])
  
          if comment.update(comment_params)
            render json: CommentSerializer.new(comment).serialized_json
          else
            render json: { error: comment.errors.messages }, status: 422
          end
        end
  
        private
  
        def comment_params
          params.require(:comment).permit(:body, :upvotes, :commentor, :post_id, :user_id)
        end
      end
    end
  end