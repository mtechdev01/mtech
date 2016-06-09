class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  def create
    super
    if resource.save
      if resource.is_registered === true
        @new_member = Newsletter.new
        @new_member.email = resource.email
        @new_member.created_at = DateTime.now
        @new_member.save
      end
      Notification.notify("Nouvel utilisateur", resource.id, "User", User.where(is_admin: true), nil)
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
