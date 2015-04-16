class Language < ActiveRecord::Base
  # model relationship
  has_many :native_users,
           class_name: 'User',
           foreign_key: 'native_language_id'

  has_many :best_users,
           class_name: 'User',
           foreign_key: 'best_language_id'

  has_many :resumes,
           class_name: 'Resume',
           foreign_key: 'language_id'

  has_many :wishlists, dependent: :destroy
  has_many :wanted_resumes,
           through: :wishlists


end
