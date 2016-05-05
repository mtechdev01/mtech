class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to  :category
  belongs_to  :owner, class_name: "User"
  has_many    :comments, as: :commentable
  has_many    :likes, as: :likeable

  self.per_page = 4

  scope :published, -> { where(published: true) }

  def self.lastProjects user
    where( author_id: user.id ).order( created_at: :desc)
  end

  def self.mostActive
    order("likes_count + comments_count*6 DESC")
    .limit(3)
  end

end
