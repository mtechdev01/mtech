class Survey < ActiveRecord::Base
  has_many :fields, class_name: "SurveysField", dependent: :delete_all
  has_many :responses, class_name: 'SurveysResponse', foreign_key: "survey_id", dependent: :delete_all
  accepts_nested_attributes_for :fields

  validates :title, presence: { message: "Le titre du sondage est obligatoire" }, uniqueness: { message: "Ce titre a déjà été utilisé" }, length: { maximum: 120, too_long: "Le titre ne doit pas dépasser les %{count} caractères" }
  validates :description, presence: { message: "La description de votre projet est obligatoire" }, length: { maximum: 350, too_long: "La description doit être concise" }

  def nbUsersResponded  
    responses.group(:user_id).count
  end

end
