class Like < ActiveRecord::Base
  belongs_to :likeable, :polymorphic => true
  belongs_to :user

  has_many    :notifications, as: :notifiable, :dependent => :destroy

  validates_uniqueness_of :user_id, scope: [:likeable_id, :likeable_type], :message => "Vous aimez déjà ce contenu !"
  validates_associated :user

end
