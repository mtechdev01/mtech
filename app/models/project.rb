class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to  :category
  belongs_to  :owner, class_name: "User"
  has_many    :comments, as: :commentable
  has_many    :likes, as: :likeable

  self.per_page = 4

  scope :published, -> { where(published: true) }

  validates :name, presence: { message: "Le nom de votre projet est obligatoire" }, uniqueness: { message: "Ce nom a déjà été utilisé" }, length: { maximum: 120, too_long: "Le nom du projet ne doit pas dépasser les %{count} caractères" }
  validates :content, presence: { message: "Le contenu de votre projet est obligatoire" }
  validates :location, presence: { message: "Le lieu est nécessaire"}
  validates_associated :category
  validates_associated :owner

  def self.lastProjects user
    where( author_id: user.id ).order( created_at: :desc)
  end

  def self.mostActive
    order("likes_count + comments_count*6 DESC")
    .limit(3)
  end

end
