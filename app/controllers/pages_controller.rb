# Handcrafted by Aydar N.
#
# me@aydar.media
#

# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @responses = Response.order(created_at: :desc).limit(10)
  end
end
