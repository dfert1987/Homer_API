class RepliesController < ApplicationController
    skip_before_action :authenticate, only:[:show, :index, :create]
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
        @reply = Reply.create(reply_params)
        render json: @reply
    end

    def update 
        @reply = Comment.update(reply_params)
        render json: @reply
    end

    private
        def reply_params
            params.require(:reply).permit(:replyText, :upVotes, :downVotes, comment_attributes: [:id, :blogComment, :upVote, :downVote, :blog, :user], :user)
        end

        def find_reply_by_id
            @reply = Reply.find(params[:id])
        end

end
end
