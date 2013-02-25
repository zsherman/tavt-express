class Users::RegistrationsController < Devise::RegistrationsController

  def new
    if params[:plan_id]
      @plan = Plan.find(params[:plan_id])
    end
    super
  end

  def create
    build_resource

    if resource.save
      if params[:user][:plan_id]
        logger.info "sounds like a plan"
        Subscription.create!(:plan_id => params[:user][:plan_id], :user_id => resource.id, :active => true)
        resource.active = true
        resource.plan_id = params[:user][:plan_id]
        resource.save
      end
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

end
