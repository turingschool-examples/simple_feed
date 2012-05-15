module Api
  class FeedsController < ApiController

    def show
      @feed = Feed.find_by_name!(params[:id])

      respond_to do |format|
        format.json
      end
    end

  end
end

