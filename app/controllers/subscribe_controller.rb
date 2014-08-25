class SubscribeController < ApplicationController
	before_filter :authenticate_user!

	def new
	end

	def update
		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		#Create a Customer
		customer = Stripe::Customer.create(
			:card => token, 
			:plan => 1923,
			:email => current_user.email
		)

		current_user.subscribed = true
		current_user.stripeid = customer.id
		current_user.save

		redirect_to todoo_index_path, :notice => "Your subscription was set up. You may access the todo list."
	end
end
