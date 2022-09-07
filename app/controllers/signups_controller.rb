class SignupsController < ApplicationController

    def create
        signup = Signup.new(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
        if signup.save
            render json: {id: signup.activity_id, name: signup.activity.name, difficulty: signup.activity.difficulty}
        else
            render json: {error: signup.errors.full_messages}, status: 422
        end
    end
    # def create
    #     signup = Signup.create(signup_params)
    #     activity = Activity.find_by(id: params[:activity_id])
    #     if signup.valid?
    #         render json: activity, only: [:id, :name, :difficulty], status: 201
    #     else
    #         render json: {errors: signup.errors.full_messages}, status: 422
    #     end
    # end

    # private
    # def signup_params
    #     params.permit(:camper_id, :activity_id, :time)
    # end
end
