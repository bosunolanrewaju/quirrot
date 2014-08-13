class RenameQuizNameFromQuizzes < ActiveRecord::Migration
  def change
  	rename_column :quizzes, :quiz_name, :title
  end
end
