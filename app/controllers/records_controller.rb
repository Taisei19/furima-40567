class RecordsController < ApplicationController

  def index
    @purchase = Purchase.new
  end

end
