class SurveysResponse < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :field, class_name: "SurveysField",
                        foreign_key: "surveys_field_id"
  belongs_to :survey
  belongs_to :user

  validates_associated :user, :survey, :surveys_field
  validates :response, presence: { message: "La réponse doit être présente" }, length: { maximum: 400, too_long: "La réponse ne peut pas dépasser les %{count} caractères" }

  def self.responsed user
    where(user: user ).group(:survey_id).order( created_at: :desc)
  end

  def self.statsResponse response
    where( field_id: response.field_id, survey_id: response.survey_id, response: response.response ).count
  end
  def self.groupedByResponse
    group(:response)
  end

  def self.hasResponsedTo user, survey
    where(user: user, survey: survey ).first
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
