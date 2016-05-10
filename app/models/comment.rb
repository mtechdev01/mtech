class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  validates :content, presence: { message: "Votre commentaire ne peut pas être vide" }, length: { maximum: 1500, too_long: "Votre commentaire ne peut pas dépasser les %{count} caractères" }
  validates_associated :user

  def self.last5
    order(created_at: :desc).limit(5)
  end

end
