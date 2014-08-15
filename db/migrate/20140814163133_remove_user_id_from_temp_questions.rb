class RemoveUserIdFromTempQuestions < ActiveRecord::Migration
  def change
    remove_column :temp_questions, :user_id, :integer
  end
end
