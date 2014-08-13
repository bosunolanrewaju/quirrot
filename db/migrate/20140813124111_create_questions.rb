class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :entry
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :answer
      t.integer :quiz_id

      t.timestamps
    end
  end
end
