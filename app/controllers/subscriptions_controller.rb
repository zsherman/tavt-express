class SubscriptionsController < ApplicationController

  def new
    plan = Plan.find(params[:plan_id])
    @subscription = plan.subscriptions.build
  end

  def create
    #if the user already has a subscription destroy the old one and sign them up for the new one
    @subscription = Subscription.new(params[:subscription])
    @subscription.user = current_user
    @subscription.active = true
    if @subscription.save
      current_user.active = true
      current_user.plan_id = @subscription.plan.id
      current_user.save
      redirect_to '/dashboard', :notice => "Thank you for subscribing! You are now free to search."
    else
      render :new
    end
  end

end
