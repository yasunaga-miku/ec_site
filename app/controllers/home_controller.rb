class HomeController < ApplicationController
  def index
    @massage = ENV["MESSAGE"]
  end
end
