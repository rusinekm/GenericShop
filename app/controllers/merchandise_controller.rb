class MerchandiseController < ApplicationController

  def index
    @merch = Merchandise.all.last(10)
  end

  def category
  end

  def new
  end

  def create 
  end

  def update
  end

  def destroy
  end
  
end
