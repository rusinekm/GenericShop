class PurchaseSessionController < ApplicationController
  before_action :authenticate_user!
 def create
    purchase_session[current_user.id] = user.id
    redirect_to root_url
  end

  def update
    purchase_session[current_user.id].add_items_to_cart(params[:merch_id])
  end

  def finish
    finish_buying
    purchasesession[current_user.id] = nil
    redirect_to root_url
  end

  def destroy
    purchasesession[current_user.id] = nil
    redirect_to root_url
  end
  
  private

  def add_items_to_cart(item_id)
    @cart || = []
    @cart<< item_id
  end


  def finish_buying
  # redirect to external paying site
  end
end
