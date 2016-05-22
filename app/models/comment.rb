class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  has_many    :notifications, as: :notifiable

  validates :content, presence: { message: "Votre commentaire ne peut pas être vide" }, length: { maximum: 1500, too_long: "Votre commentaire ne peut pas dépasser les %{count} caractères" }
  validates_associated :user


end
