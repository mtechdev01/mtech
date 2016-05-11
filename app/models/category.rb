class Category < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders] # you can now do MyClass.find('bar')
  mount_uploader :icon, ThumbUploader

  has_many :articles
  has_many :projects

  validates :name, presence: { message: "Le nom de la catégorie est obligatoire" }, uniqueness: { message: "Cette catégorie existe déjà" }
  
end
