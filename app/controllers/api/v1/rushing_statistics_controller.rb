# frozen_string_literal: true

module Api
  module V1
    class RushingStatisticsController < JsonApiController
      def index
        render json: results(Rushing, filter_player), links: {}, meta: pages_info
      rescue StandardError
        render json: { errors: ['Error getting rushings'] }, status: :unprocessable_entity
      end

      private

      def filter_player
        return unless params[:player]

        "player LIKE '%#{params[:player]}%'"
      end
    end
  end
end
