class CreateSurveys < ActiveRecord::Migration
  def change

    create_table :surveys do |t|
      t.timestamps  null: false
      t.string      :title
      t.text        :description
      t.integer     :nb_responses
      t.datetime    :start_at
      t.datetime    :end_at
    end

    create_table :surveys_fields do |t|
      t.belongs_to  :survey, index: true
      t.string      :input_type
      t.boolean     :is_required
      t.string      :question
      t.string      :options
      t.string      :rules
    end

    create_table :surveys_responses do |t|
      t.timestamps  null: false
      t.belongs_to  :survey, index: true
      t.belongs_to  :surveys_field, index: true, as: :fields
      t.belongs_to  :user, index: true, as: :user
      t.string      :response
    end
  end

end
