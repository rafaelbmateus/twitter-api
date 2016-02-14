module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]

      # GET /users
      # GET /users.json
      # curl -X GET -H "Content-Type: application/json" http://localhost:3000/api/v1/users
      def index
        @users = User.all

        render json: @users
      end

      # GET /users/1
      # GET /users/1.json
      # curl -X GET -H "Content-Type: application/json" http://localhost:3000/api/v1/users/1
      def show
        render json: @user
      end

      # POST /users
      # POST /users.json
      # curl -X POST -H "Content-type: application/json" -d '{"user":{"name":"@rafaelbmateus"}}' http://localhost:3000/api/v1/users
      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      # PATCH/PUT /users/1.json
      # curl -X PUT -H "Content-Type: application/json" -d '{"user":{"name":"@rafaelbmateus1"}}' http://localhost:3000/api/v1/users/1
      def update
        @user = User.find(params[:id])

        if @user.update(user_params)
          head :no_content
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1
      # DELETE /users/1.json
      # curl -X DELETE -H "Content-Type: application/json" http://localhost:3000/api/v1/users/1
      def destroy
        @user.destroy

        head :no_content
      end

      private

        def set_user
          @user = User.find(params[:id])
        end

        def user_params
          params.require(:user).permit(:name)
        end
    end
  end
end
