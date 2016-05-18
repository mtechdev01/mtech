class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to  :category
  belongs_to  :owner, class_name: "User"
  has_many    :comments, as: :commentable
  has_many    :interactions
  mount_uploader :thumb, ThumbUploader
  self.per_page = 4

  scope :published, -> { where(published: true) }

  validates :name, presence: { message: "Le nom de votre projet est obligatoire" }, uniqueness: { message: "Ce nom a déjà été utilisé" }, length: { maximum: 120, too_long: "Le nom du projet ne doit pas dépasser les %{count} caractères" }
  validates :content, presence: { message: "Le contenu de votre projet est obligatoire" }
  validates :location, presence: { message: "Le lieu est nécessaire"}
  validates_associated :category
  validates_associated :owner

  def self.lastProjects user
      where(owner: user ).order( created_at: :desc)
  end

  def self.lasts
    self.all.where(published: "t").order(created_at: :desc).first(3)
  end

  def self.mostActive
    hash = Hash.new
    most_active = Array.new
    self.all.each do |project|
      if project.published
        score = ((project.comments.count)*8)+(project.interactions.where(role: "support").count)+((project.interactions.where(role: "participation").count)*3)
        hash[project] = score
      end
    end
    hash = hash.sort_by{|_key, value| value}.reverse.first(3)
    hash.each do |element|
      most_active.push(element[0])
    end
      return most_active
  end

end
