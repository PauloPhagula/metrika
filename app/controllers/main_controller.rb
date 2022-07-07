class MainController < ApplicationController
  def index
    frontend_url = ENV.fetch("FRONTEND_URL") { "http://127.0.0.1:3001" }
    redirect_to frontend_url, allow_other_host: true
  end
end
