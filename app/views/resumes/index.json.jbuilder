json.array!(@resumes) do |resume|
  json.extract! resume, :id, :sentence, :is_translation, :owner_id, :translator_id, :language_id
  json.url resume_url(resume, format: :json)
end
