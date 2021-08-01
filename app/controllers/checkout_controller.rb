class CheckoutController < ApplicationController
  def create
    product = Product.find(params[:id])
    @session = Stripe::Checkout::Session.create({
                                       customer: current_user.stripe_customer_id,
                                       success_url: root_url,
                                       cancel_url: root_url,
                                       payment_method_types: ['card'],
                                       line_items: [{
                                                      name: product.name,
                                                      amount: product.price,
                                                      currency: "usd",
                                                      quantity: 1
                                                    }],
                                       mode: 'payment',
                                     })
    respond_to do |format|
      format.js
    end
  end
end