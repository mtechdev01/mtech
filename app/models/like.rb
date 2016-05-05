class Comment < ActiveRecord::Base
  belongs_to :likeable, :polymorphic => true
  belongs_to :user

end
