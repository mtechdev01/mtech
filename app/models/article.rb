class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  mount_uploader :thumb, ThumbUploader

  self.per_page = 4
  belongs_to  :category
  belongs_to  :author, class_name: "User"
  has_many    :comments, as: :commentable
  has_many    :likes, as: :likeable

  scope :published, -> { where(published: true) }


  def messageSanitized
    @contentSanitized = ActionView::Base.full_sanitizer.sanitize( self.content.html_safe )
    return @contentSanitized
  end
end
