class SurveysField < ActiveRecord::Base

  belongs_to :survey
  has_many :responses, class_name: "SurveysResponse"
  has_many :user, through: :survey_fields_responses

  accepts_nested_attributes_for :responses

  validates :input_type, presence: { message: "Le type est nécessaire" }
  validates :question, presence: { message: "La question ne peut être vide" }, length: { maximum: 400, too_long: "La question ne doit pas dépasser les %{count} caractères" }
  validates_associated :survey

  def optionsFormated
    if self.options != nil
      return self.options.split(",").map(&:to_s)
    end
  end

  def getResponse
    return self.responses.groupedByResponse
  end

  def rulesFormated
    if self.rules != nil
      return self.rules.remove(",")
    end
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
