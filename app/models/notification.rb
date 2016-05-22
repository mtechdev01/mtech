class Notification < ActiveRecord::Base
  belongs_to :notifiable, :polymorphic => true
  belongs_to :user

  validates_associated :user

    def self.notify(message, notifiable_id, notifiable_type, receivers)
      receivers.each do |receiver|
        @notification = Notification.new
        @notification.message = message
        @notification.notifiable_id =  notifiable_id
        @notification.notifiable_type =  notifiable_type
        @notification.user = receiver
        @notification.created_at = DateTime.now
        @notification.read = false
        @notification.save
      end
    end
end
