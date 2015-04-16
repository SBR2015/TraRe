class Resume < ActiveRecord::Base
  # model relationship
  belongs_to :written_language,
             class_name: 'Language',
             foreign_key: 'language_id'

  belongs_to :wanted_language,
             class_name: 'Language',
             foreign_key: 'wanted_language_id'

  belongs_to :owner,
             class_name: 'User',
             foreign_key: 'owner_id'

  belongs_to :translator,
             class_name: 'User',
             foreign_key: 'translator_id'

end
