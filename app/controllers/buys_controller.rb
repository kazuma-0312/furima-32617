class BuysController < ApplicationController

  def index
    @home_buy = HomeBuy.new
  end
end
