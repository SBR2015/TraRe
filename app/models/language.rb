class Language < ActiveRecord::Base
  # model relationship
  has_many :native_users,
           class_name: 'User',
           foreign_key: 'native_language_id'

  has_many :best_users,
           class_name: 'User',
           foreign_key: 'best_language_id'

  has_many :written_resumes,
           class_name: 'Resume',
           foreign_key: 'language_id'

  has_many :wanted_resumes,
           class_name: 'Resume',
           foreign_key: 'wanted_language_id'

end
