class RemarksController < ApplicationController
    skip_before_action :authenticate, only:[:show, :create, :update]
    before_action :find_comment_by_id, only:[:show, :update]

    def index
        @remarks = Remark.all
        render json: @remarks
    end

    def show
        @remark = Remark.find(params[:id])
        render json: @remark
    end

    def create
        @remark = Remark.create(remark_params)
        render json: @remark
    end

    def update 
        @remark = Remark.update(remark_params)
        render json: @Remark
    end

    private
        def remark_params
            params.require(:remark).permit(:comment, :upVote, :downVote, :blogID, :userID)
        end

        def find_remark_by_id
            @remark = Remark.find(params[:id])
        end
end
