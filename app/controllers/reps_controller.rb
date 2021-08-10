class RepsController < ApplicationController
    skip_before_action :authenticate, only:[:show, :index, :create, :update]
    before_action :find_rep_by_id, only:[:show, :update]

    def index
        @reps = Rep.all
        render json: @reps
    end

    def show
        @rep = Rep.find(params[:id])
        render json: @rep
    end

    def create
        @rep = Rep.create(rep_params)
        render json: @rep
    end

    def update 
        @rep = Rep.update(rep_params)
        render json: @rep
    end

    private
        def rep_params
            params.require(:rep).permit(:reply, :upVotes, :downVotes, :commentID, :userID)
        end

        def find_rep_by_id
            @rep = Rep.find(params[:id])
        end
end
