class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  def create
    super
    if resource.save
      Notification.notify("Nouvel utilisateur", nil, nil, User.where(is_admin: true), nil)
    end
  end

  private
    def check_captcha
      if verify_recaptcha
        true
      else
        self.resource = resource_class.new sign_up_params
        respond_with_navigational(resource) { render :new }
      end
    end
end
