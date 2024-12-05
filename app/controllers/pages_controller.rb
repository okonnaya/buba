class PagesController < ApplicationController
  def index
    @response = Response.new
    @responses = Response.order(created_at: :desc).limit(10)
  end
end
