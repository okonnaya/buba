class ResponsesController < ApplicationController
  def create
    @response = Response.new(response_params)
    @response.save
    redirect_to root_path
  end

  private

  def response_params
    params.require(:response).permit(:email, :message)
  end
end
