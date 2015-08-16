class MerchandiseController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :update, :edit, :destroy]
  
  def index
    @merch = Merchandise.all.last(10)
  end

  def new
   @merchandise = Merchandise.new 
  end

  def show
  @merchandise = Merchandise.find(params[:id])
  end

  def edit
   @merchandise = Merchandise.find(params[:id])
  end

  def create 
    @merchandise = Merchandise.new(merch_params)
    if @merchandise.save
      flash[:notice] = "Item created"
      redirect_to root
    else
      render :new
    end
  end

  def update
    @merchandise = Merchandise.new(merch_params)
    if @merchandise.update_attributes(merch_params)
      flash[:notice] = "Item updated"
      redirect_to root
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root, flash[:notice] = "Item deleted"
  end

  private

  def merch_params
    params.require(:post).permit(:name, :description,  :retail_price, :buy_price, :number_available, :photo) #:category_ids =>[])
  end

end