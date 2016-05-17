class Interaction < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :project
    
  validates_uniqueness_of :user_id, scope: [:project_id, :role], :message => "Vous avez déjà effectué cette action!"
  validates_associated :user, :project
    
end
