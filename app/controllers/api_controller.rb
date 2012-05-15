class ApiController < ActionController::Base
  before_filter :authenticate

  private

  def authenticate
    if self.current_user = authenticate_with_http_basic do |username, password|
        login(username, password)
      end
    else
      request_http_basic_authentication
    end
  end

  def construct_link_header(next_url, last_url)
    "<#{next_url}>; rel=\"next\", <#{last_url}>; rel=\"last\""
  end

  def current_user
    @current_user
  end

  def current_user=(user)
    @current_user = user
  end
end
