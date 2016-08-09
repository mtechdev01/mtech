class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  has_many    :notifications, as: :notifiable, :dependent => :destroy

  validates :content, presence: { message: "Votre commentaire ne peut pas être vide" }, length: { maximum: 1500, too_long: "Votre commentaire ne peut pas dépasser les %{count} caractères" }
  validates_associated :user

  def self.to_csv
   CSV.generate do |csv|
     csv << column_names
     all.each do |row|
       csv << row.attributes.values_at(*column_names)
     end
   end
  end

end
