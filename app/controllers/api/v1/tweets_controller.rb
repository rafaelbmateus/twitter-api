module Api
  module V1
    class TweetsController < ApplicationController
      before_action :set_tweet, only: [:show, :update, :destroy]

      # GET /tweets
      # GET /tweets.json
      # curl -X GET -H "Content-Type: application/json" http://localhost:3000/api/v1/tweets
      def index
        @tweets = Tweet.all

        render json: @tweets
      end

      # GET /tweets/1
      # GET /tweets/1.json
      # curl -X GET -H "Content-Type: application/json" http://localhost:3000/api/v1/tweets/1
      def show
        render json: @tweet
      end

      # POST /tweets
      # POST /tweets.json
      # curl -X POST -H "Content-type: application/json" -d '{"tweet":{"user_id":"1","content":"Test"}}' http://localhost:3000/api/v1/tweets
      def create
        @tweet = Tweet.new(tweet_params)

        if @tweet.save
          render json: @tweet, status: :created
        else
          render json: @tweet.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tweets/1
      # PATCH/PUT /tweets/1.json
      # curl -X PUT -H "Content-Type: application/json" -d '{"tweet":{"user_id":"1","content":"Alter test"}}' http://localhost:3000/api/v1/tweets/1
      def update
        @tweet = Tweet.find(params[:id])

        if @tweet.update(tweet_params)
          head :no_content
        else
          render json: @tweet.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tweets/1
      # DELETE /tweets/1.json
      # curl -X DELETE -H "Content-Type: application/json" http://localhost:3000/api/v1/tweets/1
      def destroy
        @tweet.destroy

        head :no_content
      end

      private

        def set_tweet
          @tweet = Tweet.find(params[:id])
        end

        def tweet_params
          params.require(:tweet).permit(:user_id, :content)
        end
    end
  end
end
