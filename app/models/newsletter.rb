class Newsletter < ActiveRecord::Base

  validates_presence_of :email, :message => "Une adresse mail est nécessaire !"
  validates_uniqueness_of :email, :message => "Vous avez déjà souscrit à la Newsletter!"

  def self.to_csv
   CSV.generate do |csv|
     csv << column_names
     all.each do |row|
       csv << row.attributes.values_at(*column_names)
     end
   end
  end

end
