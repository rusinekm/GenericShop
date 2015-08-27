class PayuController < ApplicationController
  include Payu::Helpers
  skip_before_filter :verify_authenticity_token

  def ok
  end

  def error
  end

  def report
    payu_verify_params(params)

    response = Payu['main'].get params[:session_id]

    if response.status == 'OK'
      order = Order.find(response.trans_order_id)

      if response.completed? && order.present?
        # mark order as paid
      else
        flash[:notice] = "Payment not completed. Please try again"
      end
    end

    render :text => 'OK'  
  end

end
