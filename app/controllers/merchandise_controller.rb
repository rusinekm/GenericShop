class MerchandiseController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :update, :edit, :destroy]
  # respond_to :json 

  def index
    if params[:category]

      respond_to do |format|
        format.html {render 'index'}
        format.json {render json: Merchandise.category(params[:category]).paginate(page: params[:page], per_page: 20)}
      end
    else
      respond_to do |format|
      format.json {render json: Merchandise.last(10)}
      format.html {render 'index'}
    end
    end
  end

  def categories
    render json: Category.all, root: 'categories'
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
      @merchandise.assign_categories(params[:merchandise][:category_names])
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
    params.require(:merchandise).permit(:name, :description,  :retail_price, :buy_price, :number_available, :photo) #:category_ids =>[])
  end

end