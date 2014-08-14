class CreateTempQuestion < ActiveRecord::Migration
  def change
    create_table :temp_questions do |t|
      t.string :question
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :answer
      t.integer :quiz_id
      t.integer :user_id
    end
  end
end
