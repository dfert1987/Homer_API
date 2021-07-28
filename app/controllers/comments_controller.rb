class CommentsController < ApplicationController
    skip_before_action :authenticate, only:[:show, :create, :update]
    before_action :find_comment_by_id, only:[:show, :update]

    def index
        @comments = Comment.all
        render json: @comments
    end

    def show
        @comment = Comment.find(params[:id])
        render json: @comment
    end

    def create
        @comment = Comment.create(comment_params)
        render json: @comment
    end

    def update 
        @comment = Comment.update(comment_params)
        render json: @comment
    end

    private
        def comment_params
            params.require(:comment).permit(:blogComment, :upVote, :downVote, :blog, :user)
        end

        def find_comment_by_id
            @comment = Comment.find(params[:id])
        end
end
