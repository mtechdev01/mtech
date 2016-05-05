class Survey < ActiveRecord::Base
  has_many :fields, class_name: "SurveysField", dependent: :delete_all
  has_many :responses, class_name: 'SurveysResponse', foreign_key: "survey_id", dependent: :delete_all
  accepts_nested_attributes_for :fields

  def nbUsersResponded
    responses.group(:user_id).count
  end

end
