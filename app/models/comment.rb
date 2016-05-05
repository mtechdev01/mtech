class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  def self.last5
    order(created_at: :desc).limit(5)
  end

end
