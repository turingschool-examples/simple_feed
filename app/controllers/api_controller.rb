class ApiController < ActionController::Base

  private

  def construct_link_header(next_url, last_url)
    "<#{next_url}>; rel=\"next\", <#{last_url}>; rel=\"last\""
  end

end
