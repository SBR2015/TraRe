json.set! :original, @original_resumes do |original|
  json.extract! original, :id, :sentence, :is_translation,
                :owner_id, :translator_id, :language_id,
                :created_at, :updated_at, :owner,
                :translator, :written_language
end

json.set! :translated, @translated_resumes do |translated|
  json.extract! translated, :id, :sentence, :is_translation,
                :owner_id, :translator_id, :language_id,
                :created_at, :updated_at, :owner,
                :translator, :written_language
end
