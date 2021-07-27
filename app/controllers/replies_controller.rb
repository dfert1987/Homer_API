class RepliesController < ApplicationController
    skip_before_action :authenticate, only:[:show, :index]
    before_action :find_reply_by_id, only:[:show, :update]

    def index
        @replies = Reply.all
        render json: @replies
    end

    def show
        @reply = Reply.find(params[:id])
        render json: @reply
    end

    def create
        @reply = Reply.create(comment_params)
        render json: @reply
    end

    def update 
        @reply = Comment.update(comment_params)
        render json: @reply
    end

    private
        def reply_params
            params.require(:reply).permit(:replyText, :upVote, :downVote, :comment, :user)
        end

        def find_reply_by_id
            @reply = Reply.find(params[:id])
        end

end
