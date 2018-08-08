json.extract! question, :id, :text, :answered_at, :created_at, :updated_at
json.url question_url(question, format: :json)
