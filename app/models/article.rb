class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  mount_uploader :thumb, ThumbUploader

  self.per_page = 4
  belongs_to  :category
  belongs_to  :owner, class_name: "User"
  has_many    :comments, as: :commentable
  has_many    :likes, as: :likeable

  scope :published, -> { where(published: true) }

  validates :name, presence: { message: "Le titre de votre article est obligatoire" }, uniqueness: { message: "Ce titre a déjà été utilisé" }, length: { maximum: 120, too_long: "Le titre ne doit pas dépasser les %{count} caractères" }
  validates :content, presence: { message: "Le contenu de votre article est obligatoire" }
  validates_associated :category
  validates_associated :owner

  def messageSanitized
    @contentSanitized = ActionView::Base.full_sanitizer.sanitize( self.content.html_safe )
    return @contentSanitized
  end

  def self.to_csv
   CSV.generate do |csv|
     csv << column_names
     all.each do |row|
       csv << row.attributes.values_at(*column_names)
     end
   end
  end
  
end
