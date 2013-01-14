class AuthenticationsController < ApplicationController

  def new

  end

  def create
    auth = request.env['omniauth.auth']

    redirect_to root_path, :notice => "#{params[:provider]} linked successfully"
  end

  def destroy

    redirect_to root_path, :notice => "Removed link to #{params[:provider]}"
  end

end


