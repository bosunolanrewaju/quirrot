json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :quiz_name, :user_id
  json.url quiz_url(quiz, format: :json)
end
