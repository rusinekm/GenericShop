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
    @purchase = Purchase.new(user_id = current_user.id, merchandise_id = @cart)
    if @purchase.save
  # redirect to external paying site
  @transaction = pos.new_transaction(first_name: current_user.name, last_name: current_user.surname, email: current_user.mail, amount: @purchase.total_price, desc: 'Transaction description')
    else
      flash[:notice] = "Something prevented from finishing purchase"
  end
end
